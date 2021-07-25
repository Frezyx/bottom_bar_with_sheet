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
      backgroundColor: Colors.indigo[900],
      body: Padding(
        padding: const EdgeInsets.all(36.0).copyWith(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bottom Bar With Sheet",
              style: TextStyle(
                color: Colors.white,
                fontSize: 42.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "v 1.0.0-beta",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: BottomBarWithSheet(
          selectedIndex: _selectedIndex,
          sheetChild: Center(child: Text("Place for your another content")),
          curve: Curves.easeOutExpo,
          duration: Duration(seconds: 1),
          bottomBarTheme: BottomBarTheme(
            mainButtonPosition: MainButtonPosition.middle,
            selectedItemIconColor: Colors.blue,
            selectedItemIconSize: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 15.0,
                  spreadRadius: 3.0,
                  offset: Offset(5.0, 5.0),
                )
              ],
            ),
          ),
          mainActionButton: FlutterLogo(size: 50),
          onSelectItem: (index) => setState(() => _selectedIndex = index),
          items: [
            BottomBarWithSheetItem(icon: Icons.home),
            BottomBarWithSheetItem(icon: Icons.favorite),
            BottomBarWithSheetItem(icon: Icons.folder),
            BottomBarWithSheetItem(icon: Icons.settings),
          ],
        ),
      ),
    );
  }
}
