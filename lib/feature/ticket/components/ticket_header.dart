import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'header_shadow.dart';
import 'header_title.dart';

class TicketHeader extends StatelessWidget {
  const TicketHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.height / 3,
          width: context.width / 1.17,
          child: Image.asset("assets/party.jpg", fit: BoxFit.fill),
        ),
        const Positioned(
          left: 0,
          bottom: 0,
          child: HeaderShadow(),
        ),
        const Positioned(
          bottom: 0,
          child: HeaderTitle(),
        )
      ],
    );
  }
}
