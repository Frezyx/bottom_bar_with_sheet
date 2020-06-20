import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarWithSheetItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Duration animationDuration;
  Color selectedBackgroundColor;
  Color selectedLabelColor;
  static const defaultDuration = Duration(milliseconds: 500);

  int index;
  int selectedIndex;
  BottomBarTheme styleBottomBar;
  double itemWidth;

  BottomBarWithSheetItem({
    Key key,
    this.label,
    this.itemWidth = 60,
    this.selectedBackgroundColor,
    this.selectedLabelColor,
    this.iconData,
    this.animationDuration = defaultDuration,
  }) : super(key: key);

  Center _makeText(String label) {
    bool isSelected = _checkItemState();
    return Center(
      child: Text(
        label,
        style: TextStyle(
          color: isSelected? styleBottomBar.selectedItemLabelColor: styleBottomBar.itemLabelColor,
          fontSize: isSelected? styleBottomBar.selectedItemTextStyle.fontSize: styleBottomBar.itemTextStyle.fontSize,
          fontWeight: isSelected? styleBottomBar.selectedItemTextStyle.fontWeight: styleBottomBar.itemTextStyle.fontWeight,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOpenedButton(IconData iconData) {
    return Center(
               child: ClipOval(
                 child: Material(
                   color: selectedBackgroundColor, // button color
                   child: Ink(
                     // splashColor: DesignTheme.secondColor,
                     child: SizedBox(
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Icon(
                           iconData,
                           size: 17,
                           color: Colors.white,
                           ),
                       )
                       ),
                   ),
                 ),
               ),
             );
  }

  Widget _buildClosedButton(IconData icon){
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Icon( 
        icon,
        size: 20,
        color: Colors.grey,
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
    selectedBackgroundColor =selectedBackgroundColor ?? styleBottomBar.selectedItemBackgroundColor;
    selectedLabelColor = selectedLabelColor ?? styleBottomBar.selectedItemLabelColor;
    bool isSelected = _checkItemState();
    double iconTopSpacer = isSelected ? 0 : 2;
    Widget labelWidget = _makeText(label);
    Widget iconAreaWidget = isSelected ? _buildOpenedButton(iconData) : _buildClosedButton(iconData);

    return AnimatedContainer(
      duration: animationDuration,
      child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: iconTopSpacer),
                  iconAreaWidget,
                  labelWidget,
                  SizedBox(height: 2),
                ]
      ),
    );
    
  }
}