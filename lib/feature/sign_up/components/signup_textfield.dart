import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SignupTextfield extends StatelessWidget {
  const SignupTextfield({
    Key? key,
    required this.onChanged,
    this.hintText,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.13),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: context.paddingLow,
          filled: true,
          fillColor: const Color(0xFF7860E1),
          border: OutlineInputBorder(
            borderRadius: context.lowBorderRadius,
          ),
        ),
      ),
    );
  }
}
