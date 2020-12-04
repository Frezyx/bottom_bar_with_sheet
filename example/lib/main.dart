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
      appBar: AppBar(
        title: Text('bottom_bar_with_sheet v0.5.2',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(child: Text("Place for your content")),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        sheetChild: Center(child: Text("Place for your another content")),
        bottomBarTheme: BottomBarTheme(
          backgroundColor: Colors.purple,
          itemIconColor: Colors.white,
          selectedItemBackgroundColor: Colors.purple,
          height: 70,
          heightClosed: 80,
          mainButtonPosition: MainButtonPosition.Middle,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(
                  5.0,
                  5.0,
                ),
              )
            ],
          ),
        ),
        mainActionButton: MainActionButton(
          width: 50,
          child: FlutterLogo(
            size: 50,
          ),
        ),
        onSelectItem: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomBarWithSheetItem(icon: Icons.people),
          BottomBarWithSheetItem(icon: Icons.shopping_cart),
          BottomBarWithSheetItem(icon: Icons.settings),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),
    );
  }
}

// import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('bottom_bar_with_sheet v0.5.1',
//             style: TextStyle(color: Colors.white)),
//       ),
//       body: Center(child: Text("Place for your content")),
//       bottomNavigationBar: BottomBarWithSheet(
//         selectedIndex: _selectedIndex,
//         sheetChild: Center(child: Text("Place for your another content")),
//         bottomBarTheme: BottomBarTheme(
//           mainButtonPosition: MainButtonPosition.Middle,
//         ),
//         mainActionButtonTheme: MainActionButtonTheme(
//           size: 55,
//           icon: Icon(
//             Icons.add,
//             color: Colors.white,
//             size: 35,
//           ),
//         ),
//         onSelectItem: (index) => setState(() => _selectedIndex = index),
//         items: [
//           BottomBarWithSheetItem(icon: Icons.people),
//           BottomBarWithSheetItem(icon: Icons.shopping_cart),
//           BottomBarWithSheetItem(icon: Icons.settings),
//           BottomBarWithSheetItem(icon: Icons.favorite),
//         ],
//       ),
//     );
//   }
// }
