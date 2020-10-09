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
      backgroundColor: Color(0xFFFFEEEE),
      appBar: AppBar(
        title: Text('bottom_bar_with_sheet v0.3.0',
            style: TextStyle().copyWith(color: Colors.white)),
        backgroundColor: Color(0xFFA81414),
      ),
      body: Center(
          child: Text("Place for your content",
              style: TextStyle().copyWith(color: Colors.black))),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        sheetChild: Center(
            child: Text("Place for your another content",
                style: TextStyle().copyWith(color: Colors.white))),
        curve: Curves.bounceOut,
        bottomBarTheme: BottomBarTheme(
          backgroundColor: Color(0xFFA81414),
          mainButtonPosition: MainButtonPosition.Left,
          selectedItemBackgroundColor: Color(0xFFFE0000),
          selectedItemIconColor: Colors.white,
          itemIconColor: Colors.white,
          itemLabelColor: Colors.white,
          selectedItemLabelColor: Colors.white,
          itemTextStyle:
              TextStyle().copyWith(fontSize: 10, fontWeight: FontWeight.w300),
          heightOpened: 600,
          height: 80,
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 60,
          splash: Color(0xFFE47676),
          color: Color(0xFFFE0000),
          // transform: Matrix4.translationValues(0.0, -31.0, 0.0),
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
            label: 'Profile',
          ),
          BottomBarWithSheetItem(
            icon: Icons.shopping_cart,
            label: 'Cart',
          ),
          BottomBarWithSheetItem(
            icon: Icons.settings,
            label: 'Settings',
          ),
          BottomBarWithSheetItem(
            icon: Icons.favorite,
            label: 'Likes',
          ),
        ],
      ),
    );
  }
}
