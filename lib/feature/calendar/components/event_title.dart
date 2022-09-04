import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:kartal/kartal.dart';

class EventTitle extends StatelessWidget {
  const EventTitle({
    Key? key,
    required this.eventList,
    required this.index,
  }) : super(key: key);
  final List<NeatCleanCalendarEvent> eventList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Text(
      eventList[index].summary,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.headline6!.copyWith(
        color: Colors.white,
      ),
    );
  }
}
