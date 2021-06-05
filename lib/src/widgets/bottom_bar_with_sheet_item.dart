import 'package:bottom_bar_with_sheet/src/providers/bottom_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Hello !
/// ----------------------------------------------------------------------
/// You can check all widget annotation
/// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
/// ----------------------------------------------------------------------

const defaultDuration = Duration(milliseconds: 500);

// ignore: must_be_immutable
class BottomBarWithSheetItem<T> extends StatelessWidget {
  final String? label;
  final IconData icon;
  final Duration animationDuration;

  /// If [noSelectionState] is true then no styling/state change happens when this item is pressed/selected
  final bool noSelectionState;
  Color? selectedBackgroundColor;
  Color? selectedLabelColor;
  bool? isLeft;
  Color? itemIconColor;

  int? _index;

  BottomBarWithSheetItem({
    Key? key,
    this.label,
    this.selectedBackgroundColor,
    required this.icon,
    this.animationDuration = defaultDuration,
    this.noSelectionState = false,
    this.itemIconColor,
  }) : super(key: key);

  Widget _buildText(String? label, {required BottomBarProvider barProvider}) {
    final bottomBarTheme = barProvider.bottomBarTheme;
    final isSelected = _checkItemState(barProvider);
    return label == null
        ? Container()
        : Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? bottomBarTheme.selectedItemLabelColor
                    : bottomBarTheme.itemLabelColor,
                fontSize: isSelected
                    ? bottomBarTheme.selectedItemTextStyle?.fontSize
                    : bottomBarTheme.itemTextStyle?.fontSize,
                fontWeight: isSelected
                    ? bottomBarTheme.selectedItemTextStyle?.fontWeight
                    : bottomBarTheme.itemTextStyle?.fontWeight,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }

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

  void setIndex(int index) {
    _index = index;
  }

  bool _checkItemState(BottomBarProvider barProvider) {
    return noSelectionState ? false : (_index == barProvider.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final _barProvider = Provider.of<BottomBarProvider>(context);

    itemIconColor = itemIconColor ?? _barProvider.bottomBarTheme.itemIconColor;
    selectedBackgroundColor = selectedBackgroundColor ??
        _barProvider.bottomBarTheme.selectedItemBackgroundColor;

    final isSelected = _checkItemState(_barProvider);
    final iconTopSpacer = isSelected ? 0.0 : 2.0;
    final labelWidget = _buildText(label, barProvider: _barProvider);
    final iconAreaWidget = isSelected
        ? _buildOpenedButton(
            Icon(icon,
                size: _barProvider.bottomBarTheme.selectedItemIconSize,
                color: _barProvider.bottomBarTheme.selectedItemIconColor),
          )
        : _buildClosedButton(
            Icon(
              icon,
              size: _barProvider.bottomBarTheme.itemIconSize,
              color: _barProvider.bottomBarTheme.itemIconColor,
            ),
          );

    return AnimatedContainer(
      duration: animationDuration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: _barProvider.mainAxisAlignment,
        children: <Widget>[
          SizedBox(height: iconTopSpacer),
          iconAreaWidget,
          labelWidget,
          SizedBox(height: 2),
        ],
      ),
    );
  }
}
