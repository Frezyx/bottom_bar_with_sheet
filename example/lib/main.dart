import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Place for your content",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
        ),
        sheetChild: Center(
          child: Text(
            "Another content",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
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
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: Text(
//           "Place for your content",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w900,
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomBarWithSheet(
//         selectedIndex: _selectedIndex,
//         sheetChild: Center(
//           child: Text(
//             "Another content",
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 20,
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//         ),
//         bottomBarTheme: BottomBarTheme(
//           mainButtonPosition: MainButtonPosition.middle,
//           selectedItemBackgroundColor: Colors.white,
//           selectedItemIconColor: Colors.blue,
//           selectedItemIconSize: 20,
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
//
