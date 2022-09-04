import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TicketFooter extends StatelessWidget {
  const TicketFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: context.height / 15,
          width: context.width / 1.5,
          child: Image.asset("assets/barcode.png", fit: BoxFit.fill),
        ),
        context.emptySizedHeightBoxLow,
        Text(
          "Barecode 19542157",
          style: context.textTheme.subtitle1?.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
