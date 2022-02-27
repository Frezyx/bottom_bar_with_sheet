import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _scrollController = PageController(initialPage: 0);
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
      body: PageView(
        controller: _scrollController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Text(
              'Home Page',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    'Today tasks',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
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
        ],
      ),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        duration: const Duration(milliseconds: 500),
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
          itemIconColor: Colors.grey[500],
          selectedItemIconColor: Colors.grey[900],
          height: 70,
          heightClosed: 80,
          heightOpened: 300,
          mainButtonPosition: MainButtonPosition.middle,
          selectedItemIconSize: 20,
          decoration: const BoxDecoration(
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
        mainActionButton: Icon(
          Icons.add,
          color: Colors.grey[900],
          size: 30,
        ),
        onSelectItem: (index) {
          setState(() => _selectedIndex = index);
          _scrollController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: const [
          BottomBarWithSheetItem(icon: Icons.home_rounded),
          BottomBarWithSheetItem(icon: Icons.calendar_today_rounded),
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
          e,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
