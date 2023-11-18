import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.onPressed,
      required this.buttonText,
      this.textColor,
      this.fontWeight,
      this.fontSize});

  final void Function()? onPressed;
  final String buttonText;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w300,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
