import '../bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

class SizeHelper {
  static double getRowWidth(bool disableMainActionButton,
      BottomBarWithSheet widget, BuildContext context) {
    final isMainActionButtonSet = widget.mainActionButton != null;
    final mainActionButtonSize = disableMainActionButton
        ? 0.0
        : isMainActionButtonSet
            ? widget.mainActionButton.width
            : widget.mainActionButtonTheme.size +
                widget.mainActionButtonTheme.margin.left +
                widget.mainActionButtonTheme.margin.right;
    final sideSize = widget.bottomBarTheme.contentPadding.left +
        widget.bottomBarTheme.contentPadding.right +
        mainActionButtonSize;
    return (MediaQuery.of(context).size.width - sideSize) / 2;
  }
}
