import 'package:bottom_bar_with_sheet/src/positions.dart';
import 'package:flutter/material.dart';

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotation
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

class BottomBarTheme {
  /// [BottomBarWithSheetItem] width
  final double itemWidth;

  /// selected [BottomBarWithSheetItem] icon color
  final Color selectedItemIconColor;

  /// selected [BottomBarWithSheetItem] label color
  final Color selectedItemLabelColor;

  /// selected [BottomBarWithSheetItem] circle background color
  final Color selectedItemBackgroundColor;

  /// selected [BottomBarWithSheetItem] text style
  final TextStyle selectedItemTextStyle;

  /// UNselected [BottomBarWithSheetItem] icon color
  final Color itemIconColor;

  /// UNselected [BottomBarWithSheetItem] label color
  final Color itemLabelColor;

  /// UNselected [BottomBarWithSheetItem] circle background color
  final Color backgroundColor;

  /// UNselected [BottomBarWithSheetItem] text style
  final TextStyle itemTextStyle;

  /// enum filed that response for the position of MainActionButton position
  /// this field have 3 possible values:
  ///
  /// [MainButtonPosition.Left] - button displayed on left side
  /// [MainButtonPosition.Right] - button displayed on right side
  /// [MainButtonPosition.Center] - button displayed on center side
  final MainButtonPosition mainButtonPosition;

  /// [BottomBarWithSheet] height when [isOpened] == false
  final double height;

  /// [BottomBarWithSheet] height when [isOpened] == true
  final double heightOpened;

  /// [BottomBarWithSheet] widget [BoxDecoration]
  final BoxDecoration decoration;

  /// [EdgeInsets] to create padding between content of widget and sides
  final EdgeInsets contentPadding;

  static const _selectedItemDefaultTextStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const _itemDefaultTextStyle = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static const _defaultBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  );

  static const _constcontentPadding =
      EdgeInsets.only(left: 10, right: 10, bottom: 0.0);

  static const _defaultboxShadow = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10.0,
      spreadRadius: 3.0,
      offset: Offset(
        5.0,
        5.0,
      ),
    )
  ];

  BottomBarTheme({
    this.contentPadding = _constcontentPadding,
    this.itemWidth = 60,
    this.height = 60,
    this.heightOpened = 300,
    this.backgroundColor = Colors.white,
    this.selectedItemBackgroundColor = Colors.blue,
    this.selectedItemIconColor = Colors.white,
    this.selectedItemLabelColor = Colors.black,
    this.itemIconColor = Colors.grey,
    this.itemLabelColor = Colors.grey,
    this.selectedItemTextStyle = _selectedItemDefaultTextStyle,
    this.itemTextStyle = _itemDefaultTextStyle,
    this.mainButtonPosition = MainButtonPosition.Left,
    this.decoration = const BoxDecoration(
      borderRadius: _defaultBorderRadius,
      boxShadow: _defaultboxShadow,
    ),
  });
}
