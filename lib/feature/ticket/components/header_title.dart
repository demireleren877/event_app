import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            "2000s Hip Hop Night",
            style: context.textTheme.headline5?.copyWith(color: Colors.white),
          ),
          context.emptySizedHeightBoxLow,
          SizedBox(
            width: context.width * 0.8,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              textAlign: TextAlign.center,
              style: context.textTheme.subtitle1?.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
