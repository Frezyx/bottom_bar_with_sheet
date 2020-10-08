import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FD),
      appBar: AppBar(
        title: Text('bottom_bar_with_sheet v0.2.1'),
        backgroundColor: const Color(0xFF2B65E3),
      ),
      body: Center(child: Text("Place for your content")),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        sheetChild: Center(child: Text("Place for your another content")),
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.Middle,
          selectedItemBackgroundColor: const Color(0xFF2B65E3),
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 60,
          color: const Color(0xFF2B65E3),
          transform: Matrix4.translationValues(0.0, -31.0, 0.0),
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
        onSelectItem: (index) => setState(() => _selectedIndex = index),
        // Five is max
        items: [
          BottomBarWithSheetItem(
            icon: Icons.people,
            // label: 'Profile',
          ),
          BottomBarWithSheetItem(
            icon: Icons.shopping_cart,
            // label: 'Cart',
          ),
          BottomBarWithSheetItem(
            icon: Icons.settings,
            // label: 'Settings',
          ),
          BottomBarWithSheetItem(
            icon: Icons.favorite,
            // label: 'Likes',
          ),
        ],
      ),
    );
  }
}
