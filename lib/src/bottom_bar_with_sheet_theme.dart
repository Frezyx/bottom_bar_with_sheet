import 'package:bottom_bar_with_sheet/src/main_button_positon.dart';
import 'package:flutter/material.dart';

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotation
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

class BottomBarTheme {
  final double rightMargin;
  final double leftMargin;

  final double notchMargin;

  final Color barBackgroundColor;
  final Color selectedItemBackgroundColor;
  final Color selectedItemIconColor;
  final Color selectedItemLabelColor;

  final Color itemIconColor;
  final Color itemLabelColor;

  final TextStyle selectedItemTextStyle;
  final TextStyle itemTextStyle;

  final MainButtonPosition mainButtonPosition;

  double barHeightClosed;
  double barHeightOpened;

  final double itemWidth;

  final double mainActionButtonSize;
  final Widget mainActionButtonIconClosed;
  final Widget mainActionButtonIconOpened;
  final Color mainActionButtonColorSplash;
  final Color mainActionButtonColor;
  final EdgeInsets mainActionButtonPadding;

  final BorderRadius borderRadius;
  final List<BoxShadow> boxShadow;

  static const selectedItemDefaultTextStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const itemDefaultTextStyle = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static const defaultBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  );

  static const constmainActionButtonPadding = EdgeInsets.all(7);

  static const defaultboxShadow = [
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
    this.leftMargin = 10,
    this.rightMargin = 10,
    this.notchMargin = 8,
    this.itemWidth = 60,
    this.barHeightClosed = 60,
    this.barHeightOpened = 300,
    this.mainActionButtonSize = 30,
    this.mainActionButtonPadding = constmainActionButtonPadding,
    this.mainActionButtonColorSplash = Colors.blue,
    this.mainActionButtonColor = Colors.blue,
    this.barBackgroundColor = Colors.white,
    this.selectedItemBackgroundColor = Colors.blue,
    this.selectedItemIconColor = Colors.white,
    this.selectedItemLabelColor = Colors.black,
    this.itemIconColor = Colors.grey,
    this.itemLabelColor = Colors.grey,
    this.selectedItemTextStyle = selectedItemDefaultTextStyle,
    this.itemTextStyle = itemDefaultTextStyle,
    this.mainActionButtonIconClosed,
    this.mainActionButtonIconOpened,
    this.borderRadius = defaultBorderRadius,
    this.boxShadow = defaultboxShadow,
    this.mainButtonPosition = MainButtonPosition.Left,
  });
}
