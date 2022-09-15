import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'header_shadow.dart';
import 'header_title.dart';

class TicketHeader extends StatelessWidget {
  const TicketHeader({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.height / 2.8,
          width: context.width / 1.17,
          child: Image.asset("assets/party.jpg", fit: BoxFit.fill),
        ),
        const Positioned(
          left: 0,
          bottom: 0,
          child: HeaderShadow(),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: context.paddingLow,
            width: context.width / 1.2,
            child: Center(
              child: HeaderTitle(title: title),
            ),
          ),
        )
      ],
    );
  }
}
