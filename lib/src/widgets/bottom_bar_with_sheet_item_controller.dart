import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:bottom_bar_with_sheet/src/widgets/bottom_bar_with_sheet_item.dart';
import 'package:flutter/material.dart';

class BottmBarItemController extends StatelessWidget {
  const BottmBarItemController({
    Key? key,
    required this.model,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final int index;
  final BottomBarWithSheetItem model;
  final BottomBarWithSheetController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BottomBarWithSheetItemWidget(
      icon: model.icon,
      noSelectionState: model.noSelectionState,
      label: model.label,
      isSelected: controller.selectedIndex == index,
    ));
  }
}
