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
      backgroundColor: Colors.grey[200],
      body: const Center(child: Text("Place for your content")),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        sheetChild: const Center(child: Text("Place for your another content")),
        bottomBarTheme: const BottomBarTheme(
          height: 70,
          heightClosed: 70,
          mainButtonPosition: MainButtonPosition.middle,
          itemIconColor: Colors.grey,
          selectedItemIconColor: Colors.red,
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          transform: Matrix4.translationValues(0, -30, 0),
        ),
        mainActionButton: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Open',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        onSelectItem: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomBarWithSheetItem(icon: Icons.settings),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),
    );
  }
}
