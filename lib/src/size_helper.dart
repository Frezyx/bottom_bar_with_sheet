import 'package:flutter/material.dart';

import '../bottom_bar_with_sheet.dart';

class SizeHelper {
  static double getRowWidth(BottomBarWithSheet widget, BuildContext context) {
    return (MediaQuery.of(context).size.width -
            widget.bottomBarTheme.contentPadding.left -
            widget.bottomBarTheme.contentPadding.right -
            widget.mainActionButtonTheme.size -
            widget.mainActionButtonTheme.margin.left -
            widget.mainActionButtonTheme.margin.right) /
        2;
  }
}
