import 'package:flutter/material.dart';

/// Hello !
/// ----------------------------------------------------------------------
/// You can check all widget annotation
/// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
/// ----------------------------------------------------------------------

const defaultDuration = Duration(milliseconds: 500);

// ignore: must_be_immutable
class BottomBarWithSheetItem extends StatelessWidget {
  final String? label;
  final IconData icon;
  final Duration animationDuration;

  /// If [noSelectionState] is true then no styling/state change happens when this item is pressed/selected
  final bool noSelectionState;
  Color? selectedBackgroundColor;
  Color? selectedLabelColor;
  bool? isLeft;
  Color? itemIconColor;

  BottomBarWithSheetItem({
    Key? key,
    this.label,
    this.selectedBackgroundColor,
    required this.icon,
    this.animationDuration = defaultDuration,
    this.noSelectionState = false,
    this.itemIconColor,
  }) : super(key: key);

  //TODO: title

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.ac_unit),
        ],
      ),
    );
  }
}
