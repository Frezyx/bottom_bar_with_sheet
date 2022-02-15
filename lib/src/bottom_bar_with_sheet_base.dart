library bottom_bar_with_sheet;

import 'dart:async';

import 'package:bottom_bar_with_sheet/src/models/bottom_bar_with_sheet_item.dart';
import 'package:bottom_bar_with_sheet/src/utils/utils.dart';
import 'package:bottom_bar_with_sheet/src/widgets/bottom_bar_with_sheet_item_controller.dart';
import 'package:bottom_bar_with_sheet/src/widgets/main_action_button.dart';
import 'package:flutter/material.dart';
import 'package:bottom_bar_with_sheet/src/theme/bottom_bar_with_sheet_theme.dart';
import 'package:bottom_bar_with_sheet/src/theme/defaults.dart';
import 'package:bottom_bar_with_sheet/src/theme/main_action_button_theme.dart';

/// Hello !
/// ----------------------------------------------------------------------
/// You can check all widget annotations, examples and docs
/// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
/// ----------------------------------------------------------------------

// ignore: must_be_immutable
class BottomBarWithSheet extends StatefulWidget {
  BottomBarWithSheet({
    Key? key,
    this.selectedIndex = 0,
    this.isOpened = false,
    this.bottomBarMainAxisAlignment = MainAxisAlignment.center,
    this.duration = defaultDuration,
    this.curve = defaultCurve,
    this.disableMainActionButton = false,
    this.mainActionButton,
    this.bottomBarTheme = defaultBarTheme,
    this.mainActionButtonTheme = defaultMainActionButtonTheme,
    this.autoClose = true,
    required this.sheetChild,
    this.onSelectItem,
    required this.items,
    this.controller,
  })  : this._controller = (controller ??
            BottomBarWithSheetController(
              initialIndex: selectedIndex,
              sheetOpened: isOpened,
            ))
          ..onItemSelect = onSelectItem,
        super(key: key) {
    assert(items.isEmpty || items.length >= 2);
    assert(bottomBarTheme.backgroundColor == null ||
        bottomBarTheme.decoration?.color == null);
  }

  /// navigation buttons of [BottomBarWithSheet]
  final List<BottomBarWithSheetItem> items;

  /// theme of [BottomBarWithSheet]
  final BottomBarTheme bottomBarTheme;

  /// theme of [MainActionButtonTheme]
  final MainActionButtonTheme mainActionButtonTheme;

  /// Callback [Function] works by clicking on one of [items]
  ///
  /// Return int [index] of selected button
  final Function(int)? onSelectItem;

  /// index of selected [BottomBarWithSheetItem] from [items]
  final int selectedIndex;

  /// Widget that displayed on bottom of [BottomBarWithSheet]
  /// when [isOpened] == true
  final Widget sheetChild;

  /// animation time of closing / opening [BottomBarWithSheet]
  final Duration duration;

  /// the style of animation from the suggested ones of [Curve]
  final Curve curve;

  /// The direction in which the widget content will line up
  final MainAxisAlignment bottomBarMainAxisAlignment;

  /// This field can replace mainActionButton
  final bool disableMainActionButton;

  /// Widget [MainActionButton] to create custom mainActionButton
  final Widget? mainActionButton;

  /// Initial open / closed state of the widget
  final bool isOpened;

  ///  If true the [BottomBarWithSheetItem]'s DO NOT automatically close the child sheet when pressed
  final bool autoClose;

  /// Controller for workin with widget state
  final BottomBarWithSheetController? controller;

  // ignore: todo
  //TODO: refactor
  late BottomBarWithSheetController _controller;

  @override
  _BottomBarWithSheetState createState() => _BottomBarWithSheetState();
}

class _BottomBarWithSheetState extends State<BottomBarWithSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _arrowAnimationController;
  late Animation _arrowAnimation;
  late List<Widget> _bottomBarItems;
  late bool _isOpened;
  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: widget.duration);
    _arrowAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_arrowAnimationController);
    _bottomBarItems = _generateItems();
    _isOpened = widget._controller.isOpened;
    _configBottomControllerListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: _getBackgroundColor(context),
      duration: widget.duration,
      curve: widget.curve,
      height: _bottomBarHeigth,
      padding: widget.bottomBarTheme.contentPadding,
      decoration: widget.bottomBarTheme.decoration,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _bottomBarItems,
          ),
          _isOpened ? Expanded(child: widget.sheetChild) : SizedBox()
        ],
      ),
    );
  }

  void _configBottomControllerListener() {
    _sub = widget._controller.stream
        .listen((event) => setState(() => _isOpened = event));
  }

  List<Widget> _generateItems() {
    return ItemsGenerator.generateByButtonPosition(
      mainActionButton: MainActionButton(
        onTap: () {
          _changeWidgetState();
        },
        button: widget.mainActionButton,
        mainActionButtonTheme: widget.mainActionButtonTheme,
        arrowAnimation: _arrowAnimation,
        arrowAnimationController: _arrowAnimationController,
        enable: !widget.disableMainActionButton,
      ),
      items: widget.items
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              BottmBarItemController(
                index: i,
                model: e,
                controller: widget._controller,
                theme: widget.bottomBarTheme,
              ),
            ),
          )
          .values
          .toList(),
      position: widget.bottomBarTheme.mainButtonPosition,
    );
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    _sub.cancel();
    super.dispose();
  }

  /// Returns colors of bar background if set
  /// Else return default theme [Color] canvasColor
  Color? _getBackgroundColor(BuildContext context) {
    final bgColor = widget.bottomBarTheme.backgroundColor;
    final decoration = widget.bottomBarTheme.decoration;

    if (bgColor != null && decoration == null) {
      return bgColor;
    } else if (decoration == null && bgColor == null) {
      return Theme.of(context).bottomNavigationBarTheme.backgroundColor;
    }
    return null;
  }

  void _changeWidgetState() {
    widget._controller.toggleSheet();
    if (_arrowAnimationController.isCompleted) {
      _arrowAnimationController.reverse();
    } else {
      _arrowAnimationController.forward();
    }
  }

  double get _bottomBarHeigth {
    final t = widget.bottomBarTheme;
    return _isOpened ? t.heightOpened : t.heightClosed;
  }
}
