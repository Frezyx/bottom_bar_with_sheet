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
    required this.items,
    this.sheetChild,
    this.bottomBarMainAxisAlignment = MainAxisAlignment.center,
    this.duration = defaultDuration,
    this.curve = defaultCurve,
    this.disableMainActionButton = false,
    this.mainActionButtonBuilder,
    this.bottomBarTheme = defaultBarTheme,
    this.mainActionButtonTheme = defaultMainActionButtonTheme,
    this.autoClose = true,
    this.onSelectItem,
    this.controller,
  })  : this._controller = (controller ??
            BottomBarWithSheetController(
              initialIndex: 0,
              sheetOpened: false,
            ))
          ..onItemSelect = onSelectItem,
        super(key: key) {
    assert(items.isEmpty || items.length >= 2);
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

  /// Widget that displayed on bottom of [BottomBarWithSheet]
  /// when [isOpened] == true
  final Widget? sheetChild;

  /// animation time of closing / opening [BottomBarWithSheet]
  final Duration duration;

  /// the style of animation from the suggested ones of [Curve]
  final Curve curve;

  /// The direction in which the widget content will line up
  final MainAxisAlignment bottomBarMainAxisAlignment;

  /// This field can replace mainActionButton
  final bool disableMainActionButton;

  /// [WidgetBuilder] to display custom mainActionButton
  final WidgetBuilder? mainActionButtonBuilder;

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
  late bool _isOpened;
  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: widget.duration);
    _arrowAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_arrowAnimationController);
    _isOpened = widget._controller.isOpened;
    _configBottomControllerListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      curve: widget.curve,
      height: _bottomBarHeigth,
      padding: widget.bottomBarTheme.contentPadding,
      decoration: widget.bottomBarTheme.decoration,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _generateItems(),
          ),
          _isOpened
              ? Expanded(child: widget.sheetChild ?? SizedBox())
              : SizedBox()
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
        button: widget.mainActionButtonBuilder?.call(context),
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
