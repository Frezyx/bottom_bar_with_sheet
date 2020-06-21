import 'package:flutter/material.dart';

class BottomBarTheme {
  final double leftMargin;
  final double rightMargin;

  // [notchMargin] size empty space beetwen [floatActionButton] and [bottomNavigationBar]
  final double notchMargin;

  final Color barBackgroundColor;
  final Color selectedItemBackgroundColor;
  final Color selectedItemIconColor;
  final Color selectedItemLabelColor;
  final Color itemBackgroundColor;
  final Color itemIconColor;
  final Color itemLabelColor;

  final TextStyle selectedItemTextStyle;
  final TextStyle itemTextStyle;

  double barHeight;
  final double itemWidth;

  final double minMainActionButtonWidth;
  

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

  BottomBarTheme({

    this.leftMargin = 10,
    this.rightMargin = 100,
    this.notchMargin = 8,
    this.itemWidth = 60,
    this.barHeight = 60.0,
    this.minMainActionButtonWidth = 70,

    this.barBackgroundColor = Colors.white,
    this.selectedItemBackgroundColor = Colors.blue,
    this.selectedItemIconColor = Colors.white,
    this.selectedItemLabelColor = Colors.black,
    this.itemBackgroundColor = Colors.transparent,
    this.itemIconColor = Colors.grey,
    this.itemLabelColor = Colors.grey,

    this.selectedItemTextStyle = selectedItemDefaultTextStyle,
    this.itemTextStyle = itemDefaultTextStyle,

  });

}
