library bottom_bar_with_sheet;

import 'dart:math' as math;

import 'package:bottom_bar_with_sheet/src/widgets/default_main_action_button.dart';
import 'package:flutter/material.dart';
import 'src/enums/positions.dart';
import 'src/theme/bottom_bar_with_sheet_theme.dart';
import 'src/theme/defaults.dart';
import 'src/theme/main_action_button_theme.dart';
import 'src/widgets/bottom_bar_with_sheet_item.dart';
import 'src/widgets/main_action_button.dart';

export 'src/enums/positions.dart';
export 'src/theme/bottom_bar_with_sheet_theme.dart';
export 'src/theme/main_action_button_theme.dart';
export 'src/widgets/bottom_bar_with_sheet_item.dart';
export 'src/widgets/main_action_button.dart';

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
  final List<BottomBarWithSheetItem>? items;

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
  final MainActionButton? mainActionButton;

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
    this.items,
    this.bottomBarTheme = defaultBarTheme,
    this.mainActionButtonTheme = defaultMainActionButtonTheme,
    this.autoClose = true,
    required this.sheetChild,
    required this.onSelectItem,
  }) : super(key: key) {
    assert(bottomBarTheme.mainButtonPosition != MainButtonPosition.middle ||
        items!.length % 2 == 0);
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
  double _iconOpacity = 1;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: widget.duration);
    _arrowAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_arrowAnimationController);
    _actionButtonIcon = widget.mainActionButtonTheme?.icon;
    super.initState();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildBody(
              widget.disableMainActionButton,
            ),
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

  List<Widget> _buildBody(
    bool disableMainActionButton,
  ) {
    final _widgets = <Widget>[
      DefaultMainActionButton(
        onTap: () {
          _animateIcon();
          _changeWidgetState();
        },
        icon: widget.mainActionButton != null
            ? _buildMainActionButton(widget.mainActionButton)
            : _actionButtonIcon,
        mainActionButtonTheme: widget.mainActionButtonTheme!,
        arrowAnimation: _arrowAnimation,
        arrowAnimationController: _arrowAnimationController,
        enable: !disableMainActionButton,
      )
    ];
    // switch (widget.bottomBarTheme.mainButtonPosition) {
    //   case MainButtonPosition.right:
    //     _widgets.insert(
    //       0,
    //       _buildButtonsRow(),
    //     );
    //     break;
    //   case MainButtonPosition.left:
    //     _widgets.add(
    //       _buildButtonsRow(),
    //     );
    //     break;
    //   case MainButtonPosition.middle:
    //   default:
    //     return _buildCentredBody();
    // }

    return _widgets;
  }

  List<Widget> _buildCentredBody() {
    final count = widget.items!.length;
    final isEven = count % 2 == 0;
    return [
      isEven
          ? _buildButtonsRow(
              leftCount: count ~/ 2,
              rightCount: count ~/ 2,
            )
          : _buildButtonsRow(
              leftCount: count ~/ 2 - 1,
              rightCount: count ~/ 2 + 1,
            )
    ];
  }

  Widget _buildButtonsRow({int? leftCount, int? rightCount}) {
    if (leftCount != null && rightCount != null) {
      for (var i = 0; i < widget.items!.length; i++) {
        if (i < leftCount) widget.items![i].isLeft = true;
      }
      return _buildCenteredView();
    } else {
      return _buildCommonView();
    }
  }

  Container _buildCommonView() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.items == null
            ? []
            : widget.items!.map((item) {
                var i = widget.items!.indexOf(item);
                return _buildItem(
                  i,
                  item,
                );
              }).toList(),
      ),
    );
  }

  Widget _buildCenteredView() {
    final children = <Widget>[];
    //TODO: MainActionButton
    children.add(_getSeparatedItems(RowPosition.left));
    children.add(_getSeparatedItems(RowPosition.right));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getSeparatedItems(
    RowPosition position,
  ) {
    final isLeft = position == RowPosition.left;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.items!
          .where((item) => isLeft
              ? item.isLeft != null && item.isLeft!
              : item.isLeft == null || !item.isLeft!)
          .map((item) {
        var i = widget.items!.indexOf(item);
        return _buildItem(
          i,
          item,
        );
      }).toList(),
    );
  }

  GestureDetector _buildItem(
    int i,
    BottomBarWithSheetItem item,
  ) {
    return GestureDetector(
      onTap: () {
        if (widget.autoClose && isOpened!) {
          _animateIcon();
          _changeWidgetState();
        }
        setState(() {
          widget.onSelectItem(i);
        });
      },
      child: _buildItemSizedBox(item),
    );
  }

  Widget _buildItemSizedBox(BottomBarWithSheetItem item) {
    return Flexible(
        child: SizedBox(
      height: widget.bottomBarTheme.height,
      child: item,
    ));
  }

  Widget _buildMainActionButton(Widget? button) {
    return InkWell(
      splashColor: widget.mainActionButtonTheme?.splash ?? Colors.transparent,
      child: AnimatedBuilder(
        animation: _arrowAnimationController,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: (_arrowAnimation.value * 2.0 * math.pi) as double,
            child: child,
          );
        },
        child: button,
      ),
      onTap: () {
        _changeWidgetState();
      },
    );
  }

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

  Future<void> _animateIcon() async {
    setState(() => _iconOpacity = 1);

    var animationTime = widget.duration.inMilliseconds / 50;
    var halfAnimationTime = animationTime / 2;
    var opacityPart = 1 / halfAnimationTime;

    for (var i = 0; i < halfAnimationTime; i++) {
      _iconOpacity -= opacityPart;
      if (_iconOpacity > 0.03 && i > halfAnimationTime / 3) {
        setState(() => _iconOpacity = _iconOpacity);
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }

    setState(() {
      _actionButtonIcon =
          _actionButtonIcon == widget.mainActionButtonTheme!.icon
              ? widget.mainActionButtonTheme!.iconOpened ??
                  widget.mainActionButtonTheme!.icon
              : widget.mainActionButtonTheme!.icon;
    });

    for (var i = 0; i < halfAnimationTime; i++) {
      _iconOpacity += opacityPart;
      if (_iconOpacity > 0.03 && i > halfAnimationTime / 3) {
        setState(() => _iconOpacity = _iconOpacity);
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }
}
