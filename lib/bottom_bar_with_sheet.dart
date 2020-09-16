library bottom_bar_with_sheet;

import 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_item.dart';
import 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_theme.dart';
import 'package:bottom_bar_with_sheet/src/positions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'src/size_helper.dart';

export 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_item.dart';
export 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_theme.dart';
export 'package:bottom_bar_with_sheet/src/positions.dart';

// Hello !
// ----------------------------------------------------------------------
// You can check all widget annotation
// In package repository: https://github.com/Frezyx/bottom_bar_with_sheet
// ----------------------------------------------------------------------

// ignore: must_be_immutable
class BottomBarWithSheet extends StatefulWidget {
  final List<BottomBarWithSheetItem> items;
  final BottomBarTheme styleBottomBar;
  final Function onSelectItem;
  final int selectedIndex;
  final Widget sheetChild;
  bool isOpened;
  Duration duration;
  Curve curve;
  MainAxisAlignment bottomBarMainAxisAlignment;

  static const constDuration = Duration(milliseconds: 500);
  static const constCurve = Curves.linear;
  BottomBarWithSheet({
    Key key,
    this.selectedIndex = 0,
    this.isOpened = false,
    this.bottomBarMainAxisAlignment = MainAxisAlignment.center,
    this.duration = constDuration,
    this.curve = constCurve,
    @required this.sheetChild,
    @required this.items,
    @required this.styleBottomBar,
    @required this.onSelectItem,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
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
  bool isOpened;
  Duration duration;
  Curve curve;
  _BottomBarWithSheetState(
      {this.selectedIndex,
      this.isOpened,
      this.bottomBarMainAxisAlignment,
      this.duration,
      this.curve,
      this.sheetChild});

  AnimationController _arrowAnimationController;
  Animation _arrowAnimation;
  var bottomSheetController;
  bool isAnimated = false;
  MainAxisAlignment bottomBarMainAxisAlignment;
  Widget sheetChild;
  Widget actionButtonIcon;

  double iconOpacity = 1;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: duration);
    _arrowAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_arrowAnimationController);
    actionButtonIcon = widget.styleBottomBar.mainActionButtonIconClosed;
    super.initState();
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  _animateIcon() async {
    setState(() {
      iconOpacity = 1;
    });

    var animationTime = widget.duration.inMilliseconds / 50;
    var halfAnimationTime = animationTime / 2;
    var opacityPart = 1 / halfAnimationTime;

    for (var i = 0; i < halfAnimationTime; i++) {
      iconOpacity -= opacityPart;
      if (iconOpacity > 0.03 && i > halfAnimationTime / 3) {
        setState(() {
          iconOpacity = iconOpacity;
        });
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }

    setState(() {
      actionButtonIcon =
          actionButtonIcon == widget.styleBottomBar.mainActionButtonIconOpened
              ? widget.styleBottomBar.mainActionButtonIconClosed
              : widget.styleBottomBar.mainActionButtonIconOpened;
    });

    for (var i = 0; i < halfAnimationTime; i++) {
      iconOpacity += opacityPart;
      if (iconOpacity > 0.03 && i > halfAnimationTime / 3) {
        setState(() {
          iconOpacity = iconOpacity;
        });
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomBarTheme styleBottomBar = widget.styleBottomBar;
    final backgroundColor = styleBottomBar.barBackgroundColor ??
        Theme.of(context).bottomAppBarColor;
    final itemWidth = MediaQuery.of(context).size.width / widget.items.length -
        (widget.styleBottomBar.rightMargin +
                widget.styleBottomBar.mainActionButtonSize +
                widget.styleBottomBar.leftMargin +
                widget.styleBottomBar.leftMargin +
                4) /
            widget.items.length;

    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      shape: CircularNotchedRectangle(),
      notchMargin: widget.styleBottomBar.rightMargin,
      child: MultiProvider(
        providers: [
          Provider<BottomBarTheme>.value(value: styleBottomBar),
          Provider<int>.value(value: widget.selectedIndex),
          Provider<bool>.value(value: widget.isOpened),
          Provider<MainAxisAlignment>.value(
              value: widget.bottomBarMainAxisAlignment),
        ],
        child: AnimatedContainer(
          duration: duration,
          curve: curve,
          height: widget.isOpened
              ? widget.styleBottomBar.barHeightOpened
              : widget.styleBottomBar.barHeightClosed,
          decoration: BoxDecoration(
            borderRadius: widget.styleBottomBar.borderRadius,
            boxShadow: widget.styleBottomBar.boxShadow,
            color: backgroundColor,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: widget.styleBottomBar.mainButtonPosition ==
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
      ),
    );
  }

  List<Widget> _buildBody(itemWidth) {
    switch (widget.styleBottomBar.mainButtonPosition) {
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
      margin: EdgeInsets.only(
          left: widget.styleBottomBar.leftMargin,
          right: widget.styleBottomBar.rightMargin),
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
    final rowWidth = SizeHelper.getRowWidth(widget, context);
    List<Widget> childrenLine = [];
    childrenLine.add(_getSeporatedItems(RowPosition.Left, rowWidth));
    childrenLine.add(_buildMainActionButtton());
    childrenLine.add(_getSeporatedItems(RowPosition.Right, rowWidth));

    return Container(
      width: MediaQuery.of(context).size.width -
          widget.styleBottomBar.leftMargin -
          widget.styleBottomBar.rightMargin,
      margin: EdgeInsets.only(
        left: widget.styleBottomBar.leftMargin,
        right: widget.styleBottomBar.rightMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: childrenLine,
      ),
    );
  }

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
          _arrowAnimationController.isCompleted
              ? _arrowAnimationController.reverse().then((value) {
                  // Call back in future version
                })
              : _arrowAnimationController.forward().then((value) {
                  // Call back in future version
                });
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
          height: widget.styleBottomBar.barHeightClosed,
          child: item,
        ),
      ),
    );
  }

  Container _buildMainActionButtton() {
    return Container(
        child: Container(
      color: Colors.transparent,
      child: Padding(
        padding: widget.styleBottomBar.mainActionButtonPadding,
        child: ClipOval(
          child: Material(
            color: widget.styleBottomBar.mainActionButtonColor, // button color
            child: InkWell(
              splashColor: widget
                  .styleBottomBar.mainActionButtonColorSplash, // inkwell color
              child: AnimatedBuilder(
                animation: _arrowAnimationController,
                builder: (BuildContext context, Widget child) {
                  return Transform.rotate(
                    angle: _arrowAnimation.value * 2.0 * math.pi,
                    child: child,
                  );
                },
                child: SizedBox(
                  width: widget.styleBottomBar.mainActionButtonSize,
                  height: widget.styleBottomBar.mainActionButtonSize,
                  child: Opacity(opacity: iconOpacity, child: actionButtonIcon),
                ),
              ),
              onTap: () {
                _animateIcon();
                setState(() {
                  widget.isOpened = !widget.isOpened;
                  _arrowAnimationController.isCompleted
                      ? _arrowAnimationController.reverse().then((value) {
                          // Call back in future version
                        })
                      : _arrowAnimationController.forward().then((value) {
                          // Call back in future version
                        });
                });
              },
            ),
          ),
        ),
      ),
    ));
  }
}
