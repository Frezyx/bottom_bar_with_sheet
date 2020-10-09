import 'package:flutter/material.dart';

const _constMargin = EdgeInsets.all(7);

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotation
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

class MainActionButtonTheme {
  /// size of [MainActionButtonTheme]
  final double size;

  /// icon that displayed when the
  /// [BottomBarWithSheet] field [isOpened] == true
  final Widget iconOpened;

  /// icon that displayed when the
  /// [BottomBarWithSheet] field [isOpened] == false
  final Widget icon;

  /// splash color of widget circle
  final Color splash;

  /// background color of widget circle
  final Color color;

  /// side paddings of [MainActionButton]
  final EdgeInsets margin;

  /// This field can set transform location of [MainActionButton]
  ///
  /// Check https://github.com/Frezyx/bottom_bar_with_sheet for understand more
  final Matrix4 transform;

  MainActionButtonTheme({
    @required this.icon,
    this.size = 30,
    this.iconOpened,
    this.splash = Colors.blue,
    this.color = Colors.blue,
    this.margin = _constMargin,
    this.transform,
  });
}
