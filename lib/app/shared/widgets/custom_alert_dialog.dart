import 'package:flutter/material.dart';

class CustomAlertDialog {
  showCustomAlertDialog(
      {Icon? icon,
      required String title,
      String? content,
      Widget? contentWidget,
      List<Widget>? actions}) {
    return AlertDialog(
      icon: icon,
      title: Text(title),
      content: contentWidget ?? Text(content ?? ''),
      actions: actions,
    );
  }
}
