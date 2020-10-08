import 'package:bottom_bar_with_sheet/src/positions.dart';
import 'package:flutter/material.dart';

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotation
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

class BottomBarTheme {
  final EdgeInsets contentPadding;
  final Color backgroundColor;
  final Color selectedItemBackgroundColor;
  final Color selectedItemIconColor;
  final Color selectedItemLabelColor;

  final Color itemIconColor;
  final Color itemLabelColor;

  final TextStyle selectedItemTextStyle;
  final TextStyle itemTextStyle;

  final MainButtonPosition mainButtonPosition;

  final double height;
  final double heightOpened;

  final double itemWidth;
  final BoxDecoration decoration;

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
