import 'package:flutter/material.dart';

/// Hello !
/// ----------------------------------------------------------------------
/// You can check all widget annotations, examples and docs
/// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
/// ----------------------------------------------------------------------

// ignore: must_be_immutable
class BottomBarWithSheetItem {
  const BottomBarWithSheetItem({
    Key? key,
    required this.icon,
    this.label,
    this.noSelectionState = false,
  });

  /// [IconData] icon of
  /// your [BottomBarWithSheetItem] navigation item
  final IconData icon;

  /// Text [String] label of
  /// your [BottomBarWithSheetItem] navigation item
  final String? label;

  /// If [noSelectionState] is true then no styling/state change happens when this item is pressed/selected
  final bool noSelectionState;
}
