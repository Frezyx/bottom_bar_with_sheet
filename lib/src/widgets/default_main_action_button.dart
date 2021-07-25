import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DefaultMainActionButton extends StatelessWidget {
  const DefaultMainActionButton({
    Key? key,
    required this.onTap,
    required this.mainActionButtonTheme,
    this.icon,
    required this.arrowAnimation,
    required this.arrowAnimationController,
    required this.enable,
  }) : super(key: key);

  final Function() onTap;
  final MainActionButtonTheme mainActionButtonTheme;
  final Widget? icon;
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
      child: Padding(
        padding: mainActionButtonTheme.margin,
        child: ClipOval(
          child: Material(
            color: mainActionButtonTheme.color ??
                Theme.of(context).iconTheme.color,
            child: InkWell(
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
                  //TODO: add icon opacity
                  child: Opacity(
                    opacity: 1.0,
                    child: icon,
                  ),
                ),
              ),
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
