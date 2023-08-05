import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../core/models/event_model.dart';
import 'components/dashed_line.dart';
import 'components/invert_circle.dart';
import 'components/ticket_footer.dart';
import 'components/ticket_header.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({
    Key? key,
    required this.event,
    required this.username,
    required this.phoneNo,
  }) : super(key: key);
  final Event event;
  final String username;
  final String phoneNo;
  //final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: context.height * 0.9,
        margin: EdgeInsets.only(top: context.height * 0.06),
        padding: const EdgeInsets.all(30),
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
                child: TicketHeader(title: event.title),
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
            Positioned(
              bottom: context.height / 4.3,
              child: Container(
                padding: context.horizontalPaddingNormal,
                width: context.width / 1.2,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ad Soyad",
                            style: context.textTheme.bodyText2!.copyWith(
                              color: Colors.white70,
                              fontSize: context.height * 0.02,
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          SizedBox(
                            width: context.width * 0.3,
                            child: Text(
                              username,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.headline6!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Text(
                            "Tarih",
                            style: context.textTheme.bodyText2!.copyWith(
                              color: Colors.white70,
                              fontSize: context.height * 0.02,
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            DateFormat('dd MMM yyyy').format(event.date),
                            style: context.textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Telefon",
                            style: context.textTheme.bodyText2!.copyWith(
                              color: Colors.white70,
                              fontSize: context.height * 0.02,
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            phoneNo,
                            style: context.textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Text(
                            "Saat",
                            style: context.textTheme.bodyText2!.copyWith(
                              color: Colors.white70,
                              fontSize: context.height * 0.02,
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            DateFormat('kk:mm').format(event.date),
                            style: context.textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
