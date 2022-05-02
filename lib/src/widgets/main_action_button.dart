import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MainActionButton extends StatelessWidget {
  const MainActionButton({
    Key? key,
    required this.onTap,
    required this.mainActionButtonTheme,
    required this.arrowAnimation,
    required this.arrowAnimationController,
    required this.enable,
    this.button,
  }) : super(key: key);

  final Function() onTap;
  final MainActionButtonTheme mainActionButtonTheme;
  final Widget? button;
  final AnimationController arrowAnimationController;
  final Animation arrowAnimation;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    if (!enable) {
      return SizedBox();
    }
    return Container(
      color: Colors.transparent,
      transform: mainActionButtonTheme.transform ??
          Matrix4.translationValues(0.0, 0.0, 0.0),
      padding: mainActionButtonTheme.margin,
      child: button != null
          ? InkWell(
              child: button,
              onTap: onTap,
            )
          : ClipOval(
              child: Material(
                color: _getIconBGColor(context),
                child: InkWell(
                  onTap: onTap,
                  splashColor: mainActionButtonTheme.splash,
                  child: AnimatedBuilder(
                    animation: arrowAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: (arrowAnimation.value * 2.0 * math.pi) as double,
                        child: child,
                      );
                    },
                    child: SizedBox(
                      width: mainActionButtonTheme.size,
                      height: mainActionButtonTheme.size,
                      child: Opacity(
                        opacity: 1.0,
                        child: Center(
                          child: mainActionButtonTheme.icon,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Color? _getIconBGColor(BuildContext context) {
    return mainActionButtonTheme.color ?? Theme.of(context).iconTheme.color;
  }
}
