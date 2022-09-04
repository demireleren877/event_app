import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HeaderShadow extends StatelessWidget {
  const HeaderShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.4,
      width: context.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.grey.shade900.withOpacity(1),
            Colors.grey.shade900.withOpacity(0.3),
            Colors.grey.shade900.withOpacity(0.15),
            Colors.grey.shade900.withOpacity(0.0)
          ],
        ),
      ),
    );
  }
}
