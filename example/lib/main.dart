import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet_item.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet_theme.dart';
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
      home: MyHomePage(title: 'bottom_bar_with_sheet v0.0.1'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello',
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: selectedIndex,
        duration: Duration(milliseconds: 600),
        styleBottomBar: BottomBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          mainActionButtonSize: 55,
          barHeightClosed: 70,
          barHeightOpened: 400,
          marginBetweenPanelAndActtionButton: 30,
          rightMargin: 15,
          mainActionButtonPadding: EdgeInsets.all(7),
          mainActionButtonIconClosed: Icon(Icons.add, color:Colors.white ),
          mainActionButtonIconOpened: Icon(Icons.arrow_drop_down, color:Colors.white ),
        ),
        onSelectItem: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomBarWithSheetItem(
            iconData: Icons.people,
            label: 'Профиль',
            selectedBackgroundColor: Colors.blue,
          ),
          BottomBarWithSheetItem(
            iconData: Icons.calendar_today,
            label: 'Календарь',
            selectedBackgroundColor: Colors.blue,
          ),
          BottomBarWithSheetItem(
            iconData: Icons.settings,
            label: 'Настройки',
            selectedBackgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
