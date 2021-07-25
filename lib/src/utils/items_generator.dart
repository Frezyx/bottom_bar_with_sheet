import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

abstract class ItemsGenerator {
  static List<Widget> generateByButtonPosition({
    required Widget mainActionButton,
    required List<Widget> items,
    required MainButtonPosition position,
  }) {
    final _items = <Widget>[];

    switch (position) {
      case MainButtonPosition.right:
        _items.addAll(items);
        _items.add(mainActionButton);
        break;
      case MainButtonPosition.left:
        _items.add(mainActionButton);
        _items.addAll(items);
        break;
      case MainButtonPosition.middle:
      default:
        final half = (items.length / 2).round();
        _items.addAll(items.getRange(0, half).toList());
        _items.add(mainActionButton);
        _items.addAll(items.getRange(half, items.length).toList());

        break;
    }

    return _items;
  }
}
