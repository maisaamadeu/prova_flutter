import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.onPressed,
      required this.iconData,
      required this.iconSize,
      this.iconColor});

  final void Function()? onPressed;
  final IconData iconData;
  final double iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
