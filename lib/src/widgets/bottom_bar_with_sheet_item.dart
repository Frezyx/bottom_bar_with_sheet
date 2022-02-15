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
    final items = _generateItems(context);
    if (theme.isVerticalItemLabel) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: items,
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items,
    );
  }

  List<Widget> _generateItems(BuildContext context) {
    final items = [
      if (!theme.isVerticalItemLabel) Spacer(),
      Icon(
        model.icon,
        color: _getIconColor(context),
        size: isSelected ? theme.selectedItemIconSize : theme.itemIconSize,
      ),
      if (model.label != null)
        if (theme.isVerticalItemLabel) ...[
          SizedBox(height: 2),
          Text(model.label!, style: _getLabelStyle(context)),
        ] else ...[
          SizedBox(width: 2),
          Expanded(
            flex: 2,
            child: Text(model.label!, style: _getLabelStyle(context)),
          ),
        ],
    ];
    return items;
  }

  Color? _getIconColor(BuildContext context) {
    final bottomNavigationTheme = Theme.of(context).bottomNavigationBarTheme;
    return isSelected
        ? theme.selectedItemIconColor ?? bottomNavigationTheme.selectedItemColor
        : theme.itemIconColor ?? bottomNavigationTheme.unselectedItemColor;
  }

  TextStyle? _getLabelStyle(BuildContext context) {
    final bottomNavigationTheme = Theme.of(context).bottomNavigationBarTheme;
    return isSelected
        ? theme.selectedItemTextStyle ??
            bottomNavigationTheme.selectedLabelStyle
        : theme.itemTextStyle ?? bottomNavigationTheme.selectedLabelStyle;
  }
}
