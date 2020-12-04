import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEEEE),
      appBar: AppBar(
        title: Text('bottom_bar_with_sheet v0.5.2',
            style: TextStyle().copyWith(color: Colors.white)),
        backgroundColor: Color(0xFFFF8D8D),
      ),
      body: Center(
          child: Text("Place for your content",
              style: TextStyle().copyWith(color: Colors.black))),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        sheetChild: _buildSheetChild(),
        disableMainActionButton: true,
        isOpened: _isOpened,
        curve: Curves.easeIn,
        bottomBarTheme: BottomBarTheme(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          backgroundColor: Color(0xFFFF8D8D),
          selectedItemBackgroundColor: Color(0xFFFF8D8D),
          selectedItemIconColor: Colors.white,
          itemIconColor: Colors.white,
          itemLabelColor: Colors.white,
          selectedItemLabelColor: Colors.white,
          itemTextStyle:
              TextStyle().copyWith(fontSize: 10, fontWeight: FontWeight.w300),
          heightOpened: 250,
          height: 0.0,
          heightClosed: 0.0,
        ),
        mainActionButtonTheme:
            MainActionButtonTheme(icon: Icon(Icons.arrow_upward_outlined)),
        onSelectItem: (index) => setState(() => _selectedIndex = index),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF8D8D),
        onPressed: () => setState(() => _isOpened = !_isOpened),
        child: Icon(
          _isOpened
              ? Icons.arrow_downward_outlined
              : Icons.arrow_upward_outlined,
        ),
      ),
    );
  }

  Widget _buildSheetChild() {
    return Center(
      child: Wrap(
        spacing: 30.0,
        children: <Widget>[
          _buildWrapItem(Icons.chat_bubble_outline, "New Chat"),
          _buildWrapItem(Icons.search_outlined, "Search"),
          _buildWrapItem(Icons.cloud_outlined, "Backup"),
          _buildWrapItem(Icons.info_outline_rounded, "Info"),
          _buildWrapItem(Icons.battery_charging_full_outlined, "Charging"),
          _buildWrapItem(Icons.settings_outlined, "Settings"),
        ],
      ),
    );
  }

  Widget _buildWrapItem(IconData icon, String title) {
    return SizedBox(
      width: 90.0,
      height: 90.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          Text(
            title,
            style: TextStyle().copyWith(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
