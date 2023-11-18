import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.validator,
    this.hintText,
    this.obscureText,
    this.prefixIcon,
    this.onChanged,
    this.filled,
    this.fillColor,
    this.textAlign,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.hintStyle,
    this.contentStyle,
    this.border,
    this.multiLine = false,
    this.enabled = true,
    this.focusNode,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? filled;
  final Color? fillColor;
  final TextAlign? textAlign;
  final TextStyle? hintStyle;
  final TextStyle? contentStyle;
  final bool? border;
  final bool multiLine;
  final bool enabled;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        labelText != null
            ? Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  labelText!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
              )
            : Container(),
        SizedBox(height: labelText != null ? 10 : 0),
        TextFormField(
          focusNode: focusNode,
          enabled: enabled,
          keyboardType: multiLine ? TextInputType.multiline : null,
          maxLines: multiLine ? null : 1,
          style: contentStyle,
          onFieldSubmitted: onFieldSubmitted != null
              ? (value) => onFieldSubmitted!(value)
              : null,
          controller: controller,
          validator: validator,
          onChanged: onChanged != null ? (value) => onChanged!(value) : null,
          textAlign: textAlign ?? TextAlign.start,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: hintStyle,
            border:
                border == true ? const OutlineInputBorder() : InputBorder.none,
            filled: filled,
            fillColor: fillColor,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }
}
