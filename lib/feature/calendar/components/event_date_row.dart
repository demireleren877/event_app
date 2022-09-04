import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

class EventDateRow extends StatelessWidget {
  const EventDateRow({
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
          Icons.date_range_outlined,
          color: Colors.pink.shade600,
          size: 20.sp,
        ),
        context.emptySizedWidthBoxLow3x,
        Text(
          DateFormat('dd MMMM yyyy').format(eventList[index].startTime),
          style: context.textTheme.bodyText2!.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
