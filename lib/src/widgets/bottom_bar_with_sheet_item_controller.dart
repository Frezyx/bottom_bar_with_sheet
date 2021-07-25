import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';

class BottmBarItemController extends StatelessWidget {
  const BottmBarItemController({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BottomBarWithSheetItem item;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: item);
  }
}
