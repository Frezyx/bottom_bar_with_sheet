import 'package:flutter/material.dart';

const _constMargin = EdgeInsets.all(7);

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotation
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

class MainActionButtonTheme {
  final double size;
  final Widget iconOpened;
  final Widget icon;
  final Color splash;
  final Color color;
  final EdgeInsets margin;
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
