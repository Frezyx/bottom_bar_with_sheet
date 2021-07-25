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

  // Widget _buildText(
  //   String? label,
  // ) {
  //   return label == null
  //       ? Container()
  //       : Center(
  //           child: Text(
  //             label,
  //             style: TextStyle(
  //               color: isSelected
  //                   ? bottomBarTheme.selectedItemLabelColor
  //                   : bottomBarTheme.itemLabelColor,
  //               fontSize: isSelected
  //                   ? bottomBarTheme.selectedItemTextStyle?.fontSize
  //                   : bottomBarTheme.itemTextStyle?.fontSize,
  //               fontWeight: isSelected
  //                   ? bottomBarTheme.selectedItemTextStyle?.fontWeight
  //                   : bottomBarTheme.itemTextStyle?.fontWeight,
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //         );
  // }

  Widget _buildOpenedButton(Widget icon) {
    return Center(
      child: ClipOval(
        child: Material(
          color: selectedBackgroundColor,
          child: Ink(
            child: SizedBox(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: icon,
            )),
          ),
        ),
      ),
    );
  }

  Widget _buildClosedButton(Widget icon) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.ac_unit),
          SizedBox(height: 2),
        ],
      ),
    );
  }
}
