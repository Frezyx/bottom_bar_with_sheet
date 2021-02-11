import 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Hello !
/// ----------------------------------------------------------------------
/// You can check all widget annotation
/// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
/// ----------------------------------------------------------------------

const defaultDuration = Duration(milliseconds: 500);

// ignore: must_be_immutable
class BottomBarWithSheetItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Duration animationDuration;
  Color selectedBackgroundColor;
  Color selectedLabelColor;
  bool isLeft;
  Color itemIconColor;
  int _index;
  int _selectedIndex;
  BottomBarTheme _bottomBarTheme;
  double itemWidth;
  MainAxisAlignment _bottomBarMainAxisAlignment;

  BottomBarWithSheetItem({
    Key key,
    this.label,
    this.itemWidth = 60,
    this.selectedBackgroundColor,
    @required this.icon,
    this.animationDuration = defaultDuration,
    this.itemIconColor,
  }) : super(key: key);

  Widget _buildText(String label) {
    bool isSelected = _checkItemState();
    return label == null
        ? Container()
        : Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? _bottomBarTheme.selectedItemLabelColor
                    : _bottomBarTheme.itemLabelColor,
                fontSize: isSelected
                    ? _bottomBarTheme.selectedItemTextStyle.fontSize
                    : _bottomBarTheme.itemTextStyle.fontSize,
                fontWeight: isSelected
                    ? _bottomBarTheme.selectedItemTextStyle.fontWeight
                    : _bottomBarTheme.itemTextStyle.fontWeight,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }

  Widget _buildOpenedButton(
      IconData icon, Color selectedItemIconColor, double selectedItemIconSize) {
    return Center(
      child: ClipOval(
        child: Material(
          color: selectedBackgroundColor,
          child: Ink(
            child: SizedBox(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                icon,
                size: selectedItemIconSize,
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
        color: _bottomBarTheme.itemIconColor,
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
    _bottomBarTheme = Provider.of<BottomBarTheme>(context);
    _selectedIndex = Provider.of<int>(context);
    _bottomBarMainAxisAlignment = Provider.of<MainAxisAlignment>(context);

    itemIconColor = itemIconColor ?? _bottomBarTheme.itemIconColor;
    selectedBackgroundColor =
        selectedBackgroundColor ?? _bottomBarTheme.selectedItemBackgroundColor;

    bool isSelected = _checkItemState();
    double iconTopSpacer = isSelected ? 0 : 2;
    Widget labelWidget = _buildText(label);
    Widget iconAreaWidget = isSelected
        ? _buildOpenedButton(icon, _bottomBarTheme.selectedItemIconColor,
            _bottomBarTheme.selectedItemIconSize)
        : _buildClosedButton(icon);

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
