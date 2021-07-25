library bottom_bar_with_sheet;

import 'package:bottom_bar_with_sheet/src/models/bottom_bar_with_sheet_item.dart';
import 'package:bottom_bar_with_sheet/src/utils/utils.dart';
import 'package:bottom_bar_with_sheet/src/widgets/bottom_bar_with_sheet_item_controller.dart';
import 'package:bottom_bar_with_sheet/src/widgets/default_main_action_button.dart';
import 'package:flutter/material.dart';
import 'src/enums/positions.dart';
import 'src/theme/bottom_bar_with_sheet_theme.dart';
import 'src/theme/defaults.dart';
import 'src/theme/main_action_button_theme.dart';

export 'src/enums/positions.dart';
export 'src/theme/bottom_bar_with_sheet_theme.dart';
export 'src/theme/main_action_button_theme.dart';
export 'src/models/bottom_bar_with_sheet_item.dart';

/// Hello !
/// ----------------------------------------------------------------------
/// You can check all widget annotation
/// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
/// ----------------------------------------------------------------------

const constCurve = Curves.linear;
const constDuration = Duration(milliseconds: 500);

// ignore: must_be_immutable
class BottomBarWithSheet extends StatefulWidget {
  /// navigation buttons of [BottomBarWithSheet]
  final List<BottomBarWithSheetItem> items;

  /// theme of [BottomBarWithSheet]
  final BottomBarTheme bottomBarTheme;

  /// theme of [MainActionButtonTheme]
  final MainActionButtonTheme? mainActionButtonTheme;

  /// Callback [Function] works by clicking on one of [items]
  ///
  /// Return int [index] of selected button
  final Function onSelectItem;

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

  BottomBarWithSheet({
    Key? key,
    this.selectedIndex = 0,
    this.isOpened = false,
    this.bottomBarMainAxisAlignment = MainAxisAlignment.center,
    this.duration = constDuration,
    this.curve = constCurve,
    this.disableMainActionButton = false,
    this.mainActionButton,
    this.bottomBarTheme = defaultBarTheme,
    this.mainActionButtonTheme = defaultMainActionButtonTheme,
    this.autoClose = true,
    required this.sheetChild,
    required this.onSelectItem,
    required this.items,
  }) : super(key: key) {
    assert(bottomBarTheme.mainButtonPosition != MainButtonPosition.middle ||
        items.length % 2 == 0);
    assert(bottomBarTheme.backgroundColor == null ||
        bottomBarTheme.decoration?.color == null);
  }

  @override
  _BottomBarWithSheetState createState() => _BottomBarWithSheetState(
        selectedIndex: selectedIndex,
        isOpened: isOpened,
      );
}

class _BottomBarWithSheetState extends State<BottomBarWithSheet>
    with SingleTickerProviderStateMixin {
  int? selectedIndex;
  bool? isOpened;

  _BottomBarWithSheetState({
    this.selectedIndex,
    this.isOpened,
  });

  Widget? _actionButtonIcon;
  late AnimationController _arrowAnimationController;
  late Animation _arrowAnimation;
  late List<Widget> _bottomBarItems;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: widget.duration);
    _arrowAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_arrowAnimationController);
    _actionButtonIcon = widget.mainActionButtonTheme?.icon;
    _bottomBarItems = _generateItems();
    super.initState();
  }

  List<Widget> _generateItems() {
    return ItemsGenerator.generateByButtonPosition(
      mainActionButton: DefaultMainActionButton(
        onTap: () {
          _changeWidgetState();
        },
        icon: widget.mainActionButton != null
            ? widget.mainActionButton
            : _actionButtonIcon,
        mainActionButtonTheme: widget.mainActionButtonTheme!,
        arrowAnimation: _arrowAnimation,
        arrowAnimationController: _arrowAnimationController,
        enable: !widget.disableMainActionButton,
      ),
      items: widget.items.map((e) => BottmBarItemController(model: e)).toList(),
      position: widget.bottomBarTheme.mainButtonPosition,
    );
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
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
          isOpened! ? Expanded(child: widget.sheetChild) : Container()
        ],
      ),
    );
  }

  /// Returns colors of bar background if set
  /// Else return default theme [Color] canvasColor
  Color? _getBackgroundColor(BuildContext context) {
    final bgColor = widget.bottomBarTheme.backgroundColor;
    final decoration = widget.bottomBarTheme.decoration;

    if (bgColor != null && decoration == null) {
      return bgColor;
    } else if (decoration == null && bgColor == null) {
      return Theme.of(context).canvasColor;
    }
    return null;
  }

  // Widget _buildItemSizedBox(BottomBarWithSheetItem item) {
  //   return Flexible(
  //     child: SizedBox(
  //       height: widget.bottomBarTheme.height,
  //       child: item,
  //     ),
  //   );
  // }

  void _changeWidgetState() {
    setState(() => isOpened = !isOpened!);
    _arrowAnimationController.isCompleted
        ? _arrowAnimationController.reverse().then(
            (value) {
              // Call back in future version
            },
          )
        : _arrowAnimationController.forward().then(
            (value) {
              // Call back in future version
            },
          );
  }

  double get _bottomBarHeigth {
    final t = widget.bottomBarTheme;
    return isOpened!
        ? t.heightOpened + t.contentPadding.bottom + t.contentPadding.top
        : t.heightClosed + t.contentPadding.bottom + t.contentPadding.top;
  }
}
