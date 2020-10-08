import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bottom_bar_with_sheet v0.2.1'),
      ),
      body: Center(child: Text("Place for your content")),
      bottomNavigationBar: BottomBarWithSheet(
        sheetChild: Center(child: Text("Place for your another content")),
        selectedIndex: selectedIndex,
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.Middle,
          height: 75,
          heightOpened: 400,
          selectedItemBackgroundColor: Colors.blue,
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 55,
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        onSelectItem: (index) => setState(() => selectedIndex = index),
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
