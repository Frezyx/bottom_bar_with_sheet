import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BaseExample());

class BaseExample extends StatelessWidget {
  const BaseExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);

  @override
  void initState() {
    _bottomBarController.stream.listen((opened) {
      debugPrint('Bottom bar ${opened ? 'opened' : 'closed'}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _bottomBarController.openSheet(),
              child: const Text('Open sheet'),
            ),
            ElevatedButton(
              onPressed: () => _bottomBarController.closeSheet(),
              child: const Text('Close sheet'),
            ),
            ElevatedButton(
              onPressed: () => _bottomBarController.toggleSheet(),
              child: const Text('Toggle sheet'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Place for your content",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWithSheet(
        controller: _bottomBarController,
        bottomBarTheme: const BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          itemIconColor: Colors.grey,
          itemTextStyle: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
          ),
          selectedItemTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: 10.0,
          ),
        ),
        onSelectItem: (index) => debugPrint('$index'),
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
        items: const [
          BottomBarWithSheetItem(icon: Icons.people),
          BottomBarWithSheetItem(icon: Icons.shopping_cart),
          BottomBarWithSheetItem(icon: Icons.settings),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),
    );
  }
}
