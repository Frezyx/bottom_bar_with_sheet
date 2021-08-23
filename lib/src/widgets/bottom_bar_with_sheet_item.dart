import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

/// Hello !
/// ----------------------------------------------------------------------
/// You can check all widget annotations, examples and docs
/// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
/// ----------------------------------------------------------------------

class BottomBarWithSheetItemWidget extends StatelessWidget {
  const BottomBarWithSheetItemWidget({
    Key? key,
    required this.model,
    required this.isSelected,
    required this.noSelectionState,
    required this.theme,
  }) : super(key: key);

  final BottomBarWithSheetItem model;
  final bool isSelected;
  final BottomBarTheme theme;

  /// If [noSelectionState] is true then no styling/state change happens when this item is pressed/selected
  final bool noSelectionState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _items,
    );
  }

  List<Widget> get _items {
    final items = <Widget>[
      Icon(
        model.icon,
        color: isSelected ? theme.selectedItemIconColor : theme.itemIconColor,
        size: isSelected ? theme.selectedItemIconSize : theme.itemIconSize,
      ),
    ];

    if (model.label != null) {
      items.addAll(
        [
          SizedBox(height: 2),
          Text(
            model.label!,
            style:
                isSelected ? theme.selectedItemTextStyle : theme.itemTextStyle,
          ),
        ],
      );
    }

    return items;
  }
}
