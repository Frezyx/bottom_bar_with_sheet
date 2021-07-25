import 'package:flutter/material.dart';

/// Hello !
/// ----------------------------------------------------------------------
/// You can check all widget annotation
/// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
/// ----------------------------------------------------------------------

// ignore: must_be_immutable
class BottomBarWithSheetItem {
  const BottomBarWithSheetItem({
    Key? key,
    this.label,
    required this.icon,
    this.noSelectionState = false,
  });

  final String? label;
  final IconData icon;

  /// If [noSelectionState] is true then no styling/state change happens when this item is pressed/selected
  final bool noSelectionState;
}
