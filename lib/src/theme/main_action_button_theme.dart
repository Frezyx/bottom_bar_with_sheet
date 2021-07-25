import 'package:flutter/material.dart';

const _kDefaultMargin = EdgeInsets.all(5);

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotations, examples and docs
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

class MainActionButtonTheme {
  /// size of [MainActionButtonTheme]
  final double size;

  /// icon that displayed when the
  /// [BottomBarWithSheet] field [isOpened] == true
  final Widget? iconOpened;

  /// icon that displayed when the
  /// [BottomBarWithSheet] field [isOpened] == false
  final Widget? icon;

  /// splash color of widget circle
  final Color? splash;

  /// background color of widget circle
  final Color? color;

  /// side paddings of [MainActionButton]
  final EdgeInsets margin;

  /// This field can set transform location of [MainActionButton]
  ///
  /// Check https://github.com/Frezyx/bottom_bar_with_sheet for understand more
  final Matrix4? transform;

  const MainActionButtonTheme({
    this.icon = const Icon(Icons.add, size: 40, color: Colors.white),
    this.size = 50,
    this.iconOpened,
    this.splash,
    this.color,
    this.margin = _kDefaultMargin,
    this.transform,
  });
}
