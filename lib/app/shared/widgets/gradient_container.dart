import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key, this.child, this.padding, this.height, this.width});

  final Widget? child;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1e4e62),
            Color(0xff2d958e),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
