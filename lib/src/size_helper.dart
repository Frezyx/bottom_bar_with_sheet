import 'package:flutter/material.dart';

import '../bottom_bar_with_sheet.dart';

class SizeHelper {
  static double getRowWidth(BottomBarWithSheet widget, BuildContext context) {
    return (MediaQuery.of(context).size.width -
            widget.styleBottomBar.contentPadding.left -
            widget.styleBottomBar.contentPadding.right -
            widget.styleBottomBar.mainActionButtonSize -
            widget.styleBottomBar.mainActionButtonPadding.left -
            widget.styleBottomBar.mainActionButtonPadding.right) /
        2;
  }
}
