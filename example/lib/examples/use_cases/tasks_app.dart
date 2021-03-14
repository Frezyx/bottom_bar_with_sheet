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
  final tasks = <String>['Something task'];
  final tasksExamples = <String>[
    'Buy new cool book',
    'Run',
    'Write homework for course',
    'Meet with friends',
    'Eat',
    'Sleep'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(
                'Today tasks',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: 5),
            Wrap(
              children: tasks
                  .map(
                    (e) => _buildTaskCard(e),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        duration: Duration(milliseconds: 500),
        sheetChild: Center(
          child: Wrap(
            children: tasksExamples
                .map(
                  (e) => _buildTaskCard(e),
                )
                .toList(),
          ),
        ),
        bottomBarTheme: BottomBarTheme(
          backgroundColor: Colors.white,
          itemIconColor: Colors.grey[900],
          selectedItemIconColor: Colors.grey[900],
          selectedItemBackgroundColor: Colors.white,
          height: 70,
          heightClosed: 80,
          heightOpened: 300,
          mainButtonPosition: MainButtonPosition.Middle,
          selectedItemIconSize: 20,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(5.0, 5.0),
              )
            ],
          ),
        ),
        mainActionButton: MainActionButton(
          width: 50,
          child: Icon(
            Icons.add,
            color: Colors.grey[900],
            size: 30,
          ),
        ),
        onSelectItem: (index) {
          print(index);
          setState(() => _selectedIndex = index);
        },
        items: [
          BottomBarWithSheetItem(icon: Icons.home),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String e) {
    return GestureDetector(
      onTap: () {
        if (tasks.contains(e)) {
          setState(() => tasks.remove(e));
          setState(() => tasksExamples.add(e));
        } else {
          setState(() => tasksExamples.remove(e));
          setState(() => tasks.add(e));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '$e',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
