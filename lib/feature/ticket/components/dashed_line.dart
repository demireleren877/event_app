import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        children: List.generate(
          1250 ~/ 10,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? Colors.transparent : Colors.grey,
              height: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}
