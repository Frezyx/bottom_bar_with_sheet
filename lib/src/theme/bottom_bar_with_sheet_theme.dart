import 'package:bottom_bar_with_sheet/src/enums/positions.dart';
import 'package:flutter/material.dart';

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotation
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

class BottomBarTheme {
  // [BottomBarWithSheetItem] width (CURRENTLY UNUSED AND IGNORED)
  //final double itemWidth;

  /// [BottomBarWithSheet] background color
  final Color? backgroundColor;

  /// selected [BottomBarWithSheetItem] icon color
  final Color? selectedItemIconColor;

  /// selected [BottomBarWithSheetItem] label color
  final Color? selectedItemLabelColor;

  /// selected [BottomBarWithSheetItem] circle background color
  final Color? selectedItemBackgroundColor;

  /// selected [BottomBarWithSheetItem] text style
  final TextStyle? selectedItemTextStyle;

  /// UNselected [BottomBarWithSheetItem] icon color
  final Color? itemIconColor;

  /// UNselected [BottomBarWithSheetItem] label color
  final Color? itemLabelColor;

  /// UNselected [BottomBarWithSheetItem] text style
  final TextStyle? itemTextStyle;

  /// enum filed that response for the position of MainActionButton position
  /// this field have 3 possible values:
  ///
  /// [MainButtonPosition.left] - button displayed on left side
  /// [MainButtonPosition.right] - button displayed on right side
  /// [MainButtonPosition.Center] - button displayed on center side
  final MainButtonPosition mainButtonPosition;

  /// [BottomBarWithSheet] icons line height
  final double height;

  /// [BottomBarWithSheet] height when [isOpened] == true
  final double heightOpened;

  /// [BottomBarWithSheet] height when [isOpened] == false
  final double heightClosed;

  /// [BottomBarWithSheet] widget [BoxDecoration]
  final BoxDecoration? decoration;

  /// [EdgeInsets] to create padding between content of widget and sides
  final EdgeInsets contentPadding;

  /// [double] size of item icon when item is pressed
  final double selectedItemIconSize;

  /// [double] size of item icon when item is not selected
  final double itemIconSize;

  static const _constcontentPadding =
      EdgeInsets.only(left: 10, right: 10, bottom: 0.0);

  const BottomBarTheme({
    this.contentPadding = _constcontentPadding,
    this.height = 75,
    this.heightOpened = 400,
    this.heightClosed = 75,
    this.backgroundColor,
    this.selectedItemBackgroundColor,
    this.selectedItemIconColor,
    this.selectedItemLabelColor,
    this.itemIconColor,
    this.itemLabelColor,
    this.selectedItemTextStyle,
    this.itemTextStyle,
    this.mainButtonPosition = MainButtonPosition.middle,
    this.decoration,
    this.itemIconSize = 20,
    this.selectedItemIconSize = 17,
  });
}
