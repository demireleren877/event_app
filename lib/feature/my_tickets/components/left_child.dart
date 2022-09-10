import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LeftChild extends StatelessWidget {
  const LeftChild({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final dynamic data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(context.width * 0.035),
            ),
            image: DecorationImage(
              image: NetworkImage(
                data["image"],
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(context.width * 0.035),
            ),
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        Center(
          child: Text(
            data["title"],
            style: context.textTheme.headline5,
          ),
        ),
      ],
    );
  }
}
