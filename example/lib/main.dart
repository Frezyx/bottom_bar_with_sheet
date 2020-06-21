import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet_item.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet_theme.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_withs_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

// class MyFloatingActionButton extends StatefulWidget {

//   @override
//   _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
// }

// class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
//   bool isOpened = false;
//   var bottomSheetController;

//   @override
//   Widget build(BuildContext context) {

//     return FloatingActionButton(
//       child: Icon(Icons.add),
//       backgroundColor: Colors.blueAccent,

//       onPressed: () {
//         if(!isOpened){
//           bottomSheetController = showBottomSheet(
//           context: context,
//           builder: (context) => Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//                   boxShadow:<BoxShadow>[
//                       BoxShadow(
//                         color: Color.fromRGBO(0, 0, 0, 0.05),
//                         offset: Offset(-100.0, 0.0),
//                         blurRadius: 10.0,
//                       ),
//                     ],
//                 ),
//                 height: 250,
//               ));
//           setState((){
//             isOpened = true;
//           });
//         }
//         else{
//           Navigator.pop(context);
//           setState((){
//               isOpened = false;
//           });
//         }
//         bottomSheetController.closed.then((value) {
//           setState((){
//             isOpened = false;
//           });
//         });
//       },
//     );
//   }
// }

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

      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: MyFloatingActionButton(),

      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: selectedIndex,
        styleBottomBar: BottomBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          barHeight: 70,
          rightMargin: 15,
          leftMargin: 15,
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
