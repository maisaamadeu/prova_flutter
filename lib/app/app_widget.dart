import 'package:flutter/material.dart';
import 'package:prova_flutter/app/pages/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff42b96e),
      ),
      home: const LoginPage(),
    );
  }
}
