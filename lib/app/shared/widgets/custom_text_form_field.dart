import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.hintText,
    this.obscureText,
    required this.iconData,
  });

  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text(
            labelText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          validator: validator!,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              iconData,
              color: Colors.black,
            ),
          ),
          obscureText: obscureText ?? false,
        )
      ],
    );
  }
}
