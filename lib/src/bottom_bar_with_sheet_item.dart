import 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotation
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

// ignore: must_be_immutable
class BottomBarWithSheetItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Duration animationDuration;
  Color selectedBackgroundColor;
  Color selectedLabelColor;

  Color itemIconColor;
  static const defaultDuration = Duration(milliseconds: 500);

  int index;
  int selectedIndex;
  BottomBarTheme styleBottomBar;
  double itemWidth;
  bool isOpened;
  MainAxisAlignment bottomBarMainAxisAlignment;

  BottomBarWithSheetItem({
    Key key,
    this.label,
    this.itemWidth = 60,
    this.selectedBackgroundColor,
    this.iconData,
    this.animationDuration = defaultDuration,
    this.bottomBarMainAxisAlignment,
    this.itemIconColor,
  }) : super(key: key);

  Center _makeText(String label) {
    bool isSelected = _checkItemState();
    return Center(
      child: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? styleBottomBar.selectedItemLabelColor
              : styleBottomBar.itemLabelColor,
          fontSize: isSelected
              ? styleBottomBar.selectedItemTextStyle.fontSize
              : styleBottomBar.itemTextStyle.fontSize,
          fontWeight: isSelected
              ? styleBottomBar.selectedItemTextStyle.fontWeight
              : styleBottomBar.itemTextStyle.fontWeight,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOpenedButton(IconData iconData, Color selectedItemIconColor) {
    return Center(
      child: ClipOval(
        child: Material(
          color: selectedBackgroundColor, // button color
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
        color: styleBottomBar.itemLabelColor,
      ),
    );
  }

  void setIndex(int index) {
    this.index = index;
  }

  bool _checkItemState() {
    return index == selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    styleBottomBar = Provider.of<BottomBarTheme>(context);
    selectedIndex = Provider.of<int>(context);
    isOpened = Provider.of<bool>(context);
    bottomBarMainAxisAlignment = Provider.of<MainAxisAlignment>(context);

    itemIconColor = itemIconColor ?? styleBottomBar.itemIconColor;
    selectedBackgroundColor =
        selectedBackgroundColor ?? styleBottomBar.selectedItemBackgroundColor;

    bool isSelected = _checkItemState();
    double iconTopSpacer = isSelected ? 0 : 2;
    Widget labelWidget = _makeText(label);
    Widget iconAreaWidget = isSelected
        ? _buildOpenedButton(iconData, styleBottomBar.selectedItemIconColor)
        : _buildClosedButton(iconData);

    return AnimatedContainer(
      duration: animationDuration,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: bottomBarMainAxisAlignment,
          children: <Widget>[
            SizedBox(height: iconTopSpacer),
            iconAreaWidget,
            labelWidget,
            SizedBox(height: 2),
          ]),
    );
  }
}
