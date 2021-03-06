library bottom_bar_with_sheet;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bottom_bar_with_sheet/src/providers/bottom_bar_provider.dart';
import 'src/enums/positions.dart';
import 'src/theme/bottom_bar_with_sheet_theme.dart';
import 'src/theme/defaults.dart';
import 'src/theme/main_action_button_theme.dart';
import 'src/utils/size_helper.dart';
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
    MainActionButtonTheme(icon: Icon(Icons.arrow_upward));
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
    final leftPadding = widget.bottomBarTheme.contentPadding.left;
    final rightPadding = widget.bottomBarTheme.contentPadding.right;
    final itemWidth = _calculateItemWidth(
        context, rightPadding, leftPadding, widget.disableMainActionButton);

    //TODO: USE THIS FIELD
    // final isOpenedLocal =
    //     widget.disableMainActionButton ? widget.isOpened : widget.isOpened;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomBarProvider>(
          create: (ctx) => BottomBarProvider(
            isOpened: isOpened,
            selectedIndex: widget.selectedIndex,
            mainAxisAlignment: widget.bottomBarMainAxisAlignment,
            bottomBarTheme: widget.bottomBarTheme,
          ),
        ),
      ],
      builder: (BuildContext context, _) {
        final _barProvider = Provider.of<BottomBarProvider>(context);
        return AnimatedContainer(
          color: _getBackgroundColor(context),
          duration: widget.duration,
          curve: widget.curve,
          height: _calculateWidgetHeight,
          padding: widget.bottomBarTheme.contentPadding,
          decoration: widget.bottomBarTheme.decoration,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: widget.bottomBarTheme.mainButtonPosition ==
                        MainButtonPosition.middle
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildBody(
                    itemWidth, widget.disableMainActionButton, _barProvider),
              ),
              isOpened! ? Expanded(child: widget.sheetChild) : Container()
            ],
          ),
        );
      },
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
    double itemWidth,
    bool disableMainActionButton,
    BottomBarProvider _barProvider,
  ) {
    switch (widget.bottomBarTheme.mainButtonPosition) {
      case MainButtonPosition.right:
        return [
          _buildButtonsRow(itemWidth, disableMainActionButton, _barProvider),
          _buildActionButton(disableMainActionButton)
        ];
      case MainButtonPosition.left:
        return [
          _buildActionButton(disableMainActionButton),
          _buildButtonsRow(itemWidth, disableMainActionButton, _barProvider)
        ];
      case MainButtonPosition.middle:
        return _buildCentredBody(
            itemWidth, disableMainActionButton, _barProvider);
      default:
        return [
          _buildButtonsRow(itemWidth, disableMainActionButton, _barProvider),
          _buildActionButton(disableMainActionButton)
        ];
    }
  }

  List<Widget> _buildCentredBody(double itemWidth, bool disableMainActionButton,
      BottomBarProvider _barProvider) {
    final count = widget.items!.length;
    final isEven = count % 2 == 0;
    return [
      isEven
          ? _buildButtonsRow(
              itemWidth,
              disableMainActionButton,
              _barProvider,
              leftCount: count ~/ 2,
              rightCount: count ~/ 2,
            )
          : _buildButtonsRow(
              itemWidth,
              disableMainActionButton,
              _barProvider,
              leftCount: count ~/ 2 - 1,
              rightCount: count ~/ 2 + 1,
            )
    ];
  }

  Container _buildButtonsRow(double itemWidth, bool disableMainActionButton,
      BottomBarProvider _barProvider,
      {int? leftCount, int? rightCount}) {
    if (leftCount != null && rightCount != null) {
      for (var i = 0; i < widget.items!.length; i++) {
        if (i < leftCount) widget.items![i].isLeft = true;
        widget.items![i].setIndex(i);
      }
      return _buildCenteredView(
        itemWidth,
        leftCount,
        rightCount,
        disableMainActionButton,
        _barProvider,
      );
    } else {
      return _buildCommonView(
        itemWidth,
        _barProvider,
      );
    }
  }

  Container _buildCommonView(double itemWidth, BottomBarProvider _barProvider) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.items == null
            ? []
            : widget.items!.map((item) {
                var i = widget.items!.indexOf(item);
                item.setIndex(i);
                return _buildItem(
                  i,
                  itemWidth,
                  item,
                  _barProvider,
                );
              }).toList(),
      ),
    );
  }

  Container _buildCenteredView(double itemWidth, int leftCount, int rightCount,
      bool disableMainActionButton, BottomBarProvider _barProvider) {
    final rowWidth =
        SizeHelper.getRowWidth(disableMainActionButton, widget, context);
    final childrenLine = <Widget>[];
    childrenLine
        .add(_getSeparatedItems(RowPosition.left, rowWidth, _barProvider));
    childrenLine.add(_buildActionButton(disableMainActionButton));
    childrenLine
        .add(_getSeparatedItems(RowPosition.right, rowWidth, _barProvider));

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

  Container _getSeparatedItems(
      RowPosition position, double rowWidth, BottomBarProvider _barProvider) {
    final isLeft = position == RowPosition.left;
    return Container(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items!
            .where((item) => isLeft
                ? item.isLeft != null && item.isLeft!
                : item.isLeft == null || !item.isLeft!)
            .map((item) {
          var i = widget.items!.indexOf(item);
          item.setIndex(i);
          return _buildItem(i, rowWidth / 2, item, _barProvider);
        }).toList(),
      ),
    );
  }

  GestureDetector _buildItem(int i, double itemWidth,
      BottomBarWithSheetItem item, BottomBarProvider _barProvider) {
    return GestureDetector(
      onTap: () {
        if (widget.autoClose && isOpened!) {
          _animateIcon();
          _changeWidgetState();
        }
        setState(() {
          widget.onSelectItem(i);
          _barProvider.selectedIndex = i;
        });
      },
      child: _buildItemSizedBox(itemWidth, item),
    );
  }

  SizedBox _buildItemSizedBox(double itemWidth, BottomBarWithSheetItem item) {
    return SizedBox(
      width: itemWidth,
      height: widget.bottomBarTheme.height,
      child: item,
    );
  }

  Widget _buildActionButton(bool disableMainActionButton) {
    if (disableMainActionButton) {
      return SizedBox();
    } else {
      return Container(
        color: Colors.transparent,
        transform: widget.mainActionButtonTheme?.transform ??
            Matrix4.translationValues(0.0, 0.0, 0.0),
        child: widget.mainActionButton != null
            ? _buildMainActionButton(widget.mainActionButton)
            : _buildDefaultMainActionButton(),
      );
    }
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

  Widget _buildDefaultMainActionButton() {
    return Padding(
      padding: widget.mainActionButtonTheme!.margin,
      child: ClipOval(
        child: Material(
          color: widget.mainActionButtonTheme?.color ??
              Theme.of(context).iconTheme.color,
          child: InkWell(
            splashColor: widget.mainActionButtonTheme!.splash,
            child: AnimatedBuilder(
              animation: _arrowAnimationController,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: (_arrowAnimation.value * 2.0 * math.pi) as double,
                  child: child,
                );
              },
              child: SizedBox(
                width: widget.mainActionButtonTheme!.size,
                height: widget.mainActionButtonTheme!.size,
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

  double get _calculateWidgetHeight {
    final t = widget.bottomBarTheme;
    return isOpened!
        ? t.heightOpened + t.contentPadding.bottom + t.contentPadding.top
        : t.heightClosed + t.contentPadding.bottom + t.contentPadding.top;
  }

  double _calculateItemWidth(BuildContext context, double rightPadding,
      double leftPadding, bool disableMainActionButton) {
    final screenWidth = MediaQuery.of(context).size.width;
    final count = widget.items != null ? widget.items!.length : 1.0;
    final mainActionButtonPaddings = widget.mainActionButtonTheme == null
        ? 0.0
        : widget.mainActionButtonTheme!.margin.left +
            widget.mainActionButtonTheme!.margin.right;
    final mainActionButtonSize = disableMainActionButton
        ? 0.0
        : widget.mainActionButtonTheme?.size ?? 0.0;
    final sideSize = rightPadding +
        mainActionButtonSize +
        mainActionButtonPaddings +
        leftPadding;
    final itemWidth = (screenWidth - sideSize) / count;
    return itemWidth;
  }

  Future<void> _animateIcon() async {
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
      _actionButtonIcon =
          _actionButtonIcon == widget.mainActionButtonTheme!.icon
              ? widget.mainActionButtonTheme!.iconOpened ??
                  widget.mainActionButtonTheme!.icon
              : widget.mainActionButtonTheme!.icon;
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
}
