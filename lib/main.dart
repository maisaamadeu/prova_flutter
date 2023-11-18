import 'package:flutter/material.dart';
import 'package:prova_flutter/app/app_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const AppWidget());
}
