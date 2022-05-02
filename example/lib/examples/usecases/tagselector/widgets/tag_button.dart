import 'package:flutter/material.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onTap,
      child: Text(title),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(theme.primaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
