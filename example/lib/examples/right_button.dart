import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: const Center(
        child: Text(
          "Place for your content",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        autoClose: false,
        sheetChild: Center(
          child: Text(
            "Another content",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        bottomBarTheme: BottomBarTheme(
          height: 80,
          heightClosed: 80,
          heightOpened: 500,
          backgroundColor: Colors.white,
          mainButtonPosition: MainButtonPosition.right,
          selectedItemIconColor: Colors.white,
          itemIconColor: Colors.grey[500],
          selectedItemIconSize: 20,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
            ),
          ),
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 65,
          color: Colors.orange,
          splash: Colors.orange[800],
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
        onSelectItem: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomBarWithSheetItem(icon: Icons.home_rounded),
          BottomBarWithSheetItem(icon: Icons.settings),
          BottomBarWithSheetItem(icon: Icons.favorite),
          BottomBarWithSheetItem(icon: Icons.bar_chart_sharp),
        ],
      ),
    );
  }
}
