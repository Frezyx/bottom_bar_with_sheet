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
        title: Text('bottom_bar_with_sheet v0.1.3'),
      ),
      body: Center(child: Text("Place for your content")),
      bottomNavigationBar: BottomBarWithSheet(
        sheetChild: Center(child: Text("Place for your another content")),
        selectedIndex: selectedIndex,
        styleBottomBar: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.Middle,
          mainActionButtonSize: 55,
          barHeightClosed: 75,
          barHeightOpened: 400,
          mainActionButtonIconClosed: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          mainActionButtonIconOpened: Icon(
            Icons.close,
            color: Colors.white,
            size: 30,
          ),
        ),
        onSelectItem: (index) => setState(() {
          selectedIndex = index;
        }),
        // Five is max
        items: [
          BottomBarWithSheetItem(
            iconData: Icons.people,
            label: 'Profile',
            selectedBackgroundColor: Colors.blue,
          ),
          BottomBarWithSheetItem(
            iconData: Icons.shopping_cart,
            label: 'Cart',
            selectedBackgroundColor: Colors.blue,
          ),
          BottomBarWithSheetItem(
            iconData: Icons.settings,
            label: 'Settings',
            selectedBackgroundColor: Colors.blue,
          ),
          BottomBarWithSheetItem(
            iconData: Icons.favorite,
            label: 'Likes',
            selectedBackgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
