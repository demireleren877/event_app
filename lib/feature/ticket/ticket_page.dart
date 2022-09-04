import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'components/dashed_line.dart';
import 'components/invert_circle.dart';
import 'components/ticket_footer.dart';
import 'components/ticket_header.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        titleSpacing: 10,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Ticket"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: context.normalBorderRadius,
                color: Colors.grey[900],
              ),
              height: context.height / 1.2,
            ),
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: context.normalBorderRadius,
                child: const TicketHeader(),
              ),
            ),
            Positioned(
              bottom: context.height / 2.28,
              child: const DashedLine(),
            ),
            InvertCircle(
              left: -context.width / 25,
              bottom: context.height / 2.4,
            ),
            InvertCircle(
              right: -context.width / 25,
              bottom: context.height / 2.4,
            ),
            Positioned(
              bottom: context.height / 5.7,
              child: const DashedLine(),
            ),
            InvertCircle(
              left: -context.width / 25,
              bottom: context.height / 6.5,
            ),
            InvertCircle(
              right: -context.width / 25,
              bottom: context.height / 6.5,
            ),
            Positioned(
              left: context.width / 11,
              bottom: context.height / 50,
              child: const TicketFooter(),
            )
          ],
        ),
      ),
    );
  }
}
