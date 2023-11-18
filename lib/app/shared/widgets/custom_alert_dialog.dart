import 'package:flutter/material.dart';

class CustomAlertDialog {
  showCustomAlertDialog(
      {Icon? icon,
      required String title,
      String? content,
      List<Widget>? actions}) {
    return AlertDialog(
      icon: icon,
      title: Text(title),
      content: Text(content ?? ''),
      actions: actions,
    );
  }
}
