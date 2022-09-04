import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class InvertCircle extends StatelessWidget {
  const InvertCircle({
    Key? key,
    this.right,
    this.bottom,
    this.left,
    this.top,
  }) : super(key: key);
  final double? right;
  final double? left;
  final double? bottom;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      bottom: bottom,
      left: left,
      top: top,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: context.width / 25,
      ),
    );
  }
}
