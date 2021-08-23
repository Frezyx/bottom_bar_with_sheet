import 'dart:async';

import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:bottom_bar_with_sheet/src/widgets/bottom_bar_with_sheet_item.dart';
import 'package:flutter/material.dart';

class BottmBarItemController extends StatefulWidget {
  const BottmBarItemController({
    Key? key,
    required this.model,
    required this.controller,
    required this.index,
    required this.theme,
  }) : super(key: key);

  final int index;
  final BottomBarWithSheetItem model;
  final BottomBarWithSheetController controller;
  final BottomBarTheme theme;

  @override
  _BottmBarItemControllerState createState() => _BottmBarItemControllerState();
}

class _BottmBarItemControllerState extends State<BottmBarItemController> {
  late int _selectedIndex;
  late StreamSubscription _sub;

  @override
  void initState() {
    _selectedIndex = widget.controller.selectedIndex;
    _sub = widget.controller.itemsStream
        .listen((i) => setState(() => _selectedIndex = i));
    super.initState();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => widget.controller.selectItem(widget.index),
        child: BottomBarWithSheetItemWidget(
          model: widget.model,
          theme: widget.theme,
          noSelectionState: widget.model.noSelectionState,
          isSelected: _selectedIndex == widget.index,
        ),
      ),
    );
  }
}
