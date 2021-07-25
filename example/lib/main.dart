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
  final _bottomBarController = BottomBarWithSheetController(
    initialIndex: 0,
    onItemSelect: (int i) {
      print(i);
    },
  );

  @override
  void initState() {
    _bottomBarController.itemsStream.listen((i) {
      print('Index $i is selcted');
    });
    super.initState();
  }

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
        controller: _bottomBarController,
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
          selectedItemIconColor: Colors.black,
        ),
        mainActionButton: Container(
          color: Colors.black,
          height: 50,
          width: 200,
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
        onSelectItem: (index) => print(index),
        items: [
          BottomBarWithSheetItem(
            icon: Icons.people,
            label: 'User',
          ),
          BottomBarWithSheetItem(
            icon: Icons.shopping_cart,
            label: 'Cart',
          ),
          // BottomBarWithSheetItem(icon: Icons.settings),
          // BottomBarWithSheetItem(icon: Icons.favorite),
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
