import 'package:bottom_bar_with_sheet/src/models/positions.dart';
import 'package:flutter/material.dart';

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotations, examples and docs
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

const _kDefaultContentPadding =
    EdgeInsets.only(left: 10, right: 10, bottom: 0.0);

class BottomBarTheme {
  /// selected [BottomBarWithSheetItem] icon color
  final Color? selectedItemIconColor;

  /// selected [BottomBarWithSheetItem] text style
  final TextStyle? selectedItemTextStyle;

  /// UNselected [BottomBarWithSheetItem] icon color
  final Color? itemIconColor;

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

  /// [BottomBarWithSheet] height when [_isOpened] == true
  final double heightOpened;

  /// [BottomBarWithSheet] height when [_isOpened] == false
  final double heightClosed;

  /// [BottomBarWithSheet] widget [BoxDecoration]
  final BoxDecoration? decoration;

  /// [EdgeInsets] to create padding between content of widget and sides
  final EdgeInsets contentPadding;

  /// [double] size of item icon when item is pressed
  final double selectedItemIconSize;

  /// [double] size of item icon when item is not selected
  final double itemIconSize;

  /// [bool] makes the labels of the items appear vertically or horizontally.
  final bool isVerticalItemLabel;

  const BottomBarTheme({
    this.contentPadding = _kDefaultContentPadding,
    this.height = 75,
    this.heightOpened = 400,
    this.heightClosed = 75,
    this.selectedItemIconColor,
    this.itemIconColor,
    this.selectedItemTextStyle,
    this.itemTextStyle,
    this.mainButtonPosition = MainButtonPosition.middle,
    this.decoration,
    this.itemIconSize = 22,
    this.selectedItemIconSize = 24,
    this.isVerticalItemLabel = true,
  });
}
