import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter_test/flutter_test.dart';

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';

void main() {
  testWidgets(
    'Launch Widget test',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: App()));
      final item = find.byType(BottomBarWithSheet);
      expect(item, findsOneWidget);
    },
  );
}

class App extends StatefulWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        sheetChild: Center(child: Text("Place for your another content")),
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.Middle,
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 55,
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
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
