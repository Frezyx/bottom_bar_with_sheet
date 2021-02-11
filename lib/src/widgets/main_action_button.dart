import 'package:flutter/material.dart';

class MainActionButton extends StatelessWidget {
  const MainActionButton({
    Key key,
    @required this.width,
    @required this.child,
  }) : super(key: key);

  /// Width size of main action widget
  final double width;

  /// Button widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: child,
    );
  }
}
