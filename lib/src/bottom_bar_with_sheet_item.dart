import 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotation
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

const defaultDuration = Duration(milliseconds: 500);

// ignore: must_be_immutable
class BottomBarWithSheetItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Duration animationDuration;
  Color selectedBackgroundColor;
  Color selectedLabelColor;
  bool isLeft;
  Color itemIconColor;
  int _index;
  int _selectedIndex;
  BottomBarTheme _styleBottomBar;
  double itemWidth;
  MainAxisAlignment _bottomBarMainAxisAlignment;

  BottomBarWithSheetItem({
    Key key,
    this.label,
    this.itemWidth = 60,
    this.selectedBackgroundColor,
    this.iconData,
    this.animationDuration = defaultDuration,
    this.itemIconColor,
  }) : super(key: key);

  Center _makeText(String label) {
    bool isSelected = _checkItemState();
    return Center(
      child: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? _styleBottomBar.selectedItemLabelColor
              : _styleBottomBar.itemLabelColor,
          fontSize: isSelected
              ? _styleBottomBar.selectedItemTextStyle.fontSize
              : _styleBottomBar.itemTextStyle.fontSize,
          fontWeight: isSelected
              ? _styleBottomBar.selectedItemTextStyle.fontWeight
              : _styleBottomBar.itemTextStyle.fontWeight,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOpenedButton(IconData iconData, Color selectedItemIconColor) {
    return Center(
      child: ClipOval(
        child: Material(
          color: selectedBackgroundColor,
          child: Ink(
            child: SizedBox(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                iconData,
                size: 17,
                color: selectedItemIconColor,
              ),
            )),
          ),
        ),
      ),
    );
  }

  Widget _buildClosedButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Icon(
        icon,
        size: 20,
        color: _styleBottomBar.itemLabelColor,
      ),
    );
  }

  void setIndex(int index) {
    this._index = index;
  }

  bool _checkItemState() {
    return _index == _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    _styleBottomBar = Provider.of<BottomBarTheme>(context);
    _selectedIndex = Provider.of<int>(context);
    _bottomBarMainAxisAlignment = Provider.of<MainAxisAlignment>(context);

    itemIconColor = itemIconColor ?? _styleBottomBar.itemIconColor;
    selectedBackgroundColor =
        selectedBackgroundColor ?? _styleBottomBar.selectedItemBackgroundColor;

    bool isSelected = _checkItemState();
    double iconTopSpacer = isSelected ? 0 : 2;
    Widget labelWidget = _makeText(label);
    Widget iconAreaWidget = isSelected
        ? _buildOpenedButton(iconData, _styleBottomBar.selectedItemIconColor)
        : _buildClosedButton(iconData);

    return AnimatedContainer(
      duration: animationDuration,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: _bottomBarMainAxisAlignment,
          children: <Widget>[
            SizedBox(height: iconTopSpacer),
            iconAreaWidget,
            labelWidget,
            SizedBox(height: 2),
          ]),
    );
  }
}
