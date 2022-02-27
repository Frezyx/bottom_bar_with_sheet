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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'bottom_bar_with_sheet v2.3.0',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: Text("Place for your content")),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        sheetChild: const Center(
          child: Text(
            "Place for your another content",
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottomBarTheme: const BottomBarTheme(
          backgroundColor: Colors.purple,
          itemIconColor: Colors.white,
          selectedItemIconColor: Colors.white,
          height: 70,
          heightClosed: 80,
          mainButtonPosition: MainButtonPosition.middle,
          selectedItemIconSize: 20,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(5.0, 5.0),
              )
            ],
          ),
        ),
        mainActionButton: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        onSelectItem: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomBarWithSheetItem(icon: Icons.people),
          BottomBarWithSheetItem(icon: Icons.shopping_cart),
          BottomBarWithSheetItem(icon: Icons.settings),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),
    );
  }
}
