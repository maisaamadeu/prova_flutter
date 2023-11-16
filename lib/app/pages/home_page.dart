import 'package:flutter/material.dart';
import 'package:prova_flutter/app/shared/widgets/gradient_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GradientContainer(
          padding: EdgeInsets.symmetric(horizontal: 30),
        ),
      ),
    );
  }
}
