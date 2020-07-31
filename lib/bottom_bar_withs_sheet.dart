library bottom_bar_with_sheet;

import 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_item.dart';
import 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_theme.dart';
import 'package:bottom_bar_with_sheet/src/main_button_positon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

export 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_item.dart';
export 'package:bottom_bar_with_sheet/src/bottom_bar_with_sheet_theme.dart';
export 'package:bottom_bar_with_sheet/src/main_button_positon.dart';

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

  animateIcon() async {
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
        (widget.styleBottomBar.otherMargin +
                widget.styleBottomBar.mainActionButtonSize +
                widget.styleBottomBar.marginBetweenPanelAndActionButton +
                widget.styleBottomBar.leftMargin +
                4) /
            widget.items.length;

    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      shape: CircularNotchedRectangle(),
      notchMargin: widget.styleBottomBar.otherMargin,
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
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.styleBottomBar.mainButtonPosition ==
                          MainButtonPosition.left
                      ? buildMainActionButtton()
                      : buildButtonsRow(itemWidth),
                  widget.styleBottomBar.mainButtonPosition ==
                          MainButtonPosition.right
                      ? buildMainActionButtton()
                      : buildButtonsRow(itemWidth),
                ],
              ),
              widget.isOpened ? Expanded(child: sheetChild) : Container()
            ],
          ),
        ),
      ),
    );
  }

  Container buildButtonsRow(double itemWidth) {
    return Container(
      margin: EdgeInsets.only(
          left: widget.styleBottomBar.marginBetweenPanelAndActionButton,
          right: widget.styleBottomBar.otherMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.items.map((item) {
          var i = widget.items.indexOf(item);
          item.setIndex(i);
          return GestureDetector(
            onTap: () {
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
        }).toList(),
      ),
    );
  }

  Container buildMainActionButtton() {
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
                animateIcon();
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
