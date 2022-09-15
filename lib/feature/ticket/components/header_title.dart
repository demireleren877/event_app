import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: context.textTheme.headline5?.copyWith(color: Colors.white),
    );
  }
}
