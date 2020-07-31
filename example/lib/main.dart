import 'package:bottom_bar_with_sheet/bottom_bar_withs_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'bottom_bar_with_sheet v0.1.0'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text("Place for your content")),
      bottomNavigationBar: BottomBarWithSheet(
        sheetChild: Center(child: Text("Place for your another content")),
        selectedIndex: selectedIndex,
        duration: Duration(milliseconds: 600),
        styleBottomBar: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.right,
          barBackgroundColor: Colors.white,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          mainActionButtonSize: 55,
          barHeightClosed: 70,
          barHeightOpened: 400,
          marginBetweenPanelAndActionButton: 30,
          otherMargin: 15,
          mainActionButtonPadding: EdgeInsets.all(7),
          mainActionButtonIconClosed: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          mainActionButtonIconOpened: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 35,
          ),
        ),
        onSelectItem: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
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
        ],
      ),
    );
  }
}
