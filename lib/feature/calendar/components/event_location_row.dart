import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

class EventLocationRow extends StatelessWidget {
  const EventLocationRow({
    Key? key,
    required this.eventList,
    required this.index,
  }) : super(key: key);
  final List<NeatCleanCalendarEvent> eventList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: Colors.pink.shade600,
          size: 20.sp,
        ),
        context.emptySizedWidthBoxLow3x,
        Text(
          eventList[index].location,
          style: context.textTheme.bodyText2!.copyWith(
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
