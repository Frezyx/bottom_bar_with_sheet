library bottom_bar_with_sheet;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/bottom_bar_with_sheet_item.dart';
import 'src/bottom_bar_with_sheet_theme.dart';
import 'src/main_action_button_theme.dart';
import 'src/positions.dart';

export 'src/bottom_bar_with_sheet_item.dart';
export 'src/bottom_bar_with_sheet_theme.dart';
export 'src/main_action_button_theme.dart';
export 'src/positions.dart';

const constCurve = Curves.linear;
const constDuration = Duration(milliseconds: 500);

// ignore: must_be_immutable
class BottomBarWithSheet extends StatefulWidget {
  final List<BottomBarWithSheetItem> items;
  final BottomBarTheme bottomBarTheme;
  final MainActionButtonTheme mainActionButtonTheme;
  final Function onSelectItem;
  final int selectedIndex;
  final Widget sheetChild;
  final Duration duration;
  final Curve curve;
  final MainAxisAlignment bottomBarMainAxisAlignment;
  bool isOpened;

  BottomBarWithSheet({
    Key key,
    this.selectedIndex = 0,
    this.isOpened = false,
    this.bottomBarMainAxisAlignment = MainAxisAlignment.center,
    this.duration = constDuration,
    this.curve = constCurve,
    @required this.sheetChild,
    @required this.items,
    @required this.bottomBarTheme,
    @required this.mainActionButtonTheme,
    @required this.onSelectItem,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(bottomBarTheme.mainButtonPosition == MainButtonPosition.Middle &&
        items.length % 2 == 0);
  }

  @override
  _BottomBarWithSheetState createState() => _BottomBarWithSheetState(
        selectedIndex: selectedIndex,
        isOpened: isOpened,
        bottomBarMainAxisAlignment: bottomBarMainAxisAlignment,
        duration: duration,
        curve: curve,
        sheetChild: sheetChild,
      );
}

class _BottomBarWithSheetState extends State<BottomBarWithSheet>
    with SingleTickerProviderStateMixin {
  int selectedIndex;
  final bool isOpened;
  final Duration duration;
  final Curve curve;
  final MainAxisAlignment bottomBarMainAxisAlignment;
  final Widget sheetChild;

  _BottomBarWithSheetState({
    this.selectedIndex,
    this.isOpened,
    this.bottomBarMainAxisAlignment,
    this.duration,
    this.curve,
    this.sheetChild,
  });

  Widget _actionButtonIcon;
  AnimationController _arrowAnimationController;
  Animation _arrowAnimation;
  double _iconOpacity = 1;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: duration);
    _arrowAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_arrowAnimationController);
    _actionButtonIcon = widget.mainActionButtonTheme.iconOpened;
    super.initState();
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  _animateIcon() async {
    setState(() {
      _iconOpacity = 1;
    });

    var animationTime = widget.duration.inMilliseconds / 50;
    var halfAnimationTime = animationTime / 2;
    var opacityPart = 1 / halfAnimationTime;

    for (var i = 0; i < halfAnimationTime; i++) {
      _iconOpacity -= opacityPart;
      if (_iconOpacity > 0.03 && i > halfAnimationTime / 3) {
        setState(() {
          _iconOpacity = _iconOpacity;
        });
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }

    setState(() {
      _actionButtonIcon = _actionButtonIcon == widget.mainActionButtonTheme.icon
          ? widget.mainActionButtonTheme.iconOpened ??
              widget.mainActionButtonTheme.icon
          : widget.mainActionButtonTheme.icon;
    });

    for (var i = 0; i < halfAnimationTime; i++) {
      _iconOpacity += opacityPart;
      if (_iconOpacity > 0.03 && i > halfAnimationTime / 3) {
        setState(() {
          _iconOpacity = _iconOpacity;
        });
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomBarTheme bottomBarTheme = widget.bottomBarTheme;
    final backgroundColor =
        bottomBarTheme.backgroundColor ?? Theme.of(context).bottomAppBarColor;
    final leftPadding = widget.bottomBarTheme.contentPadding.left;
    final rightPadding = widget.bottomBarTheme.contentPadding.right;
    final itemWidth = _calculateItemWidth(context, rightPadding, leftPadding);

    return MultiProvider(
      providers: [
        Provider<BottomBarTheme>.value(value: bottomBarTheme),
        Provider<int>.value(value: widget.selectedIndex),
        Provider<bool>.value(value: widget.isOpened),
        Provider<MainAxisAlignment>.value(
            value: widget.bottomBarMainAxisAlignment),
      ],
      child: AnimatedContainer(
        duration: duration,
        curve: curve,
        height: _calculateWidgetHeight(),
        padding: widget.bottomBarTheme.contentPadding,
        decoration: widget.bottomBarTheme.decoration.copyWith(
          color: backgroundColor,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: widget.bottomBarTheme.mainButtonPosition ==
                      MainButtonPosition.Middle
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildBody(itemWidth),
            ),
            widget.isOpened ? Expanded(child: sheetChild) : Container()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBody(itemWidth) {
    switch (widget.bottomBarTheme.mainButtonPosition) {
      case MainButtonPosition.Right:
        return [_buildButtonsRow(itemWidth), _buildMainActionButtton()];
        break;
      case MainButtonPosition.Left:
        return [_buildMainActionButtton(), _buildButtonsRow(itemWidth)];
        break;
      case MainButtonPosition.Middle:
        return _buildCentredBody(itemWidth);
        break;
      default:
        return [_buildButtonsRow(itemWidth), _buildMainActionButtton()];
        break;
    }
  }

  List<Widget> _buildCentredBody(itemWidth) {
    final count = widget.items.length;
    final isEven = count % 2 == 0;
    return [
      isEven
          ? _buildButtonsRow(itemWidth,
              leftCount: count ~/ 2, rightCount: count ~/ 2)
          : _buildButtonsRow(itemWidth,
              leftCount: count ~/ 2 - 1, rightCount: count ~/ 2 + 1)
    ];
  }

  Container _buildButtonsRow(double itemWidth,
      {int leftCount, int rightCount}) {
    if (leftCount != null && rightCount != null) {
      for (var i = 0; i < widget.items.length; i++) {
        if (i < leftCount) widget.items[i].isLeft = true;
        widget.items[i].setIndex(i);
      }
      return _buildCenteredView(itemWidth, leftCount, rightCount);
    } else
      return _buildStandartView(itemWidth);
  }

  Container _buildStandartView(double itemWidth) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.items.map((item) {
          var i = widget.items.indexOf(item);
          item.setIndex(i);
          return _buildItem(i, itemWidth, item);
        }).toList(),
      ),
    );
  }

  Container _buildCenteredView(
      double itemWidth, int leftCount, int rightCount) {
    final rowWidth = _SizeHelper.getRowWidth(widget, context);
    List<Widget> childrenLine = [];
    childrenLine.add(_getSeporatedItems(RowPosition.Left, rowWidth));
    childrenLine.add(_buildMainActionButtton());
    childrenLine.add(_getSeporatedItems(RowPosition.Right, rowWidth));

    return Container(
      width: _calculateInnerWidth(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: childrenLine,
      ),
    );
  }

  double _calculateInnerWidth() =>
      MediaQuery.of(context).size.width -
      widget.bottomBarTheme.contentPadding.left -
      widget.bottomBarTheme.contentPadding.right;

  Container _getSeporatedItems(RowPosition position, double rowWidth) {
    final isLeft = position == RowPosition.Left;
    return Container(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items
            .where((item) => isLeft
                ? item.isLeft != null && item.isLeft
                : item.isLeft == null || !item.isLeft)
            .map((item) {
          var i = widget.items.indexOf(item);
          item.setIndex(i);
          return _buildItem(i, rowWidth / 2, item);
        }).toList(),
      ),
    );
  }

  GestureDetector _buildItem(
      int i, double itemWidth, BottomBarWithSheetItem item) {
    return GestureDetector(
      onTap: () {
        if (widget.isOpened) {
          _animateIcon();
          _changeWidgetState();
        }
        setState(() {
          widget.onSelectItem(i);
          selectedIndex = i;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: SizedBox(
          width: itemWidth,
          height: widget.bottomBarTheme.height,
          child: item,
        ),
      ),
    );
  }

  Container _buildMainActionButtton() {
    return Container(
      color: Colors.transparent,
      transform: widget.mainActionButtonTheme.transform ??
          Matrix4.translationValues(0.0, 0.0, 0.0),
      child: Padding(
        padding: widget.mainActionButtonTheme.margin,
        child: ClipOval(
          child: Material(
            color: widget.mainActionButtonTheme.color, // button color
            child: InkWell(
              splashColor: widget.mainActionButtonTheme.splash, // inkwell color
              child: AnimatedBuilder(
                animation: _arrowAnimationController,
                builder: (BuildContext context, Widget child) {
                  return Transform.rotate(
                    angle: _arrowAnimation.value * 2.0 * math.pi,
                    child: child,
                  );
                },
                child: SizedBox(
                  width: widget.mainActionButtonTheme.size,
                  height: widget.mainActionButtonTheme.size,
                  child: Opacity(
                    opacity: _iconOpacity,
                    child: _actionButtonIcon,
                  ),
                ),
              ),
              onTap: () {
                _animateIcon();
                _changeWidgetState();
              },
            ),
          ),
        ),
      ),
    );
  }

  void _changeWidgetState() {
    setState(() => widget.isOpened = !widget.isOpened);
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

  double _calculateWidgetHeight() => widget.isOpened
      ? widget.bottomBarTheme.heightOpened +
          widget.bottomBarTheme.contentPadding.bottom +
          widget.bottomBarTheme.contentPadding.top
      : widget.bottomBarTheme.height +
          widget.bottomBarTheme.contentPadding.bottom +
          widget.bottomBarTheme.contentPadding.top;

  double _calculateItemWidth(
      BuildContext context, double rightPadding, double leftPadding) {
    return MediaQuery.of(context).size.width / widget.items.length -
        (rightPadding +
                widget.mainActionButtonTheme.size +
                leftPadding +
                leftPadding +
                4) /
            widget.items.length;
  }
}

class _SizeHelper {
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
