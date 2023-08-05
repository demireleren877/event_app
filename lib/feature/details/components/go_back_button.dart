import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.height * 0.03,
      backgroundColor: Colors.white24,
      child: IconButton(
        padding: EdgeInsets.zero,
        color: Colors.white,
        icon: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
