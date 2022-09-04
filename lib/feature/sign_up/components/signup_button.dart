import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;

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
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: context.dynamicWidth(0.04),
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFACA0DF)),
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
