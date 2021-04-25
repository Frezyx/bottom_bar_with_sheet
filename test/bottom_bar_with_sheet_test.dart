import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter_test/flutter_test.dart';
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

  testWidgets(
    'Tap MainActionButton test',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: App()));
      final button = find.byType(MainActionButton);

      await tester.tap(button);
      await tester.pump();

      final text = find.text('Place for your another content');
      expect(text, findsOneWidget);
    },
  );

  testWidgets(
    'Tap BottomBarWithSheetItem test',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: App()));
      final button = find.byType(BottomBarWithSheetItem).first;

      await tester.tap(button);
      await tester.pump();

      expect(button, findsOneWidget);
    },
  );

  testWidgets(
    'Close BottomBar after open test',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: App()));

      final button = find.byType(MainActionButton);

      await tester.tap(button);
      await tester.pump();

      await tester.tap(button);
      await tester.pump();

      final text = find.text('Place for your another content');
      expect(text, findsNothing);
    },
  );
}

class App extends StatefulWidget {
  const App({
    Key? key,
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
        sheetChild: Center(child: Text('Place for your another content')),
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 55,
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
        mainActionButton: MainActionButton(
          width: 50,
          child: Container(
            width: 50.0,
            height: 50.0,
            color: Colors.blue,
          ),
        ),
        onSelectItem: (int index) => setState(() => _selectedIndex = index),
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
