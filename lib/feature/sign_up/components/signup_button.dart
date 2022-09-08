import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.textColor,
    required this.buttonColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: context.dynamicHeight(0.06),
          width: context.dynamicWidth(0.6),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: context.textTheme.bodyLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w900,
                fontSize: context.dynamicWidth(0.04),
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: context.lowBorderRadius,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
