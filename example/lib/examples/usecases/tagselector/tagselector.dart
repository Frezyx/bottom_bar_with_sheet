import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:example/examples/usecases/tagselector/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TagSelectorExample extends StatelessWidget {
  const TagSelectorExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        iconTheme: const IconThemeData(
          color: Colors.purple,
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
  final _pageController = PageController();
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);
  final _selectedTags = <String>[];
  final _unselectedTags = <String>[
    '#food',
    '#yummy',
    '#foodstagram',
    '#foodlovers',
    '#foodgasm',
    '#eat',
    '#foodpics',
    '#love',
    '#foodblogger',
    '#hungry',
    '#foodgram',
    '#instafood',
    '#foodpic',
    '#cooking',
    '#chef',
    '#foodblog',
    '#foods',
    '#meal',
    '#instagood',
    '#healthy',
    '#delicious',
    '#foodphotography',
    '#foodie',
    '#sweet',
    '#foodlover',
    '#foodies',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Tag selector',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          TagsSelectingPage(
            selectedTags: _selectedTags,
            onSelect: (tag) {
              _unselectedTags.remove(tag);
              _selectedTags.add(tag);
              setState(() {});
            },
          ),
          GeneratedPostPage(selectedTags: _selectedTags),
        ],
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
            color: Colors.purple,
            fontSize: 10.0,
          ),
        ),
        onSelectItem: (index) => _pageController.jumpToPage(index),
        sheetChild: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 10,
                children: _unselectedTags
                    .map(
                      (e) => TagButton(
                        onTap: () {
                          _unselectedTags.remove(e);
                          _selectedTags.add(e);
                          setState(() {});
                        },
                        title: e,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        items: const [
          BottomBarWithSheetItem(icon: Icons.tag_sharp),
          BottomBarWithSheetItem(icon: Icons.design_services),
        ],
      ),
    );
  }
}
