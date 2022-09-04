import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:kartal/kartal.dart';

import 'event_date_row.dart';
import 'event_location_row.dart';
import 'event_title.dart';

class EventDetailColumn extends StatelessWidget {
  const EventDetailColumn({
    Key? key,
    required this.eventList,
    required this.index,
  }) : super(key: key);
  final List<NeatCleanCalendarEvent> eventList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          EventTitle(
            eventList: eventList,
            index: index,
          ),
          context.emptySizedHeightBoxLow,
          EventLocationRow(
            eventList: eventList,
            index: index,
          ),
          context.emptySizedHeightBoxLow,
          EventDateRow(
            eventList: eventList,
            index: index,
          ),
        ],
      ),
    );
  }
}
