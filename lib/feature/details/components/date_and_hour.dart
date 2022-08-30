import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/event_model.dart';

class DatenHour extends StatelessWidget {
  const DatenHour({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final Event arguments;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.date_range_outlined,
          color: Colors.pink.shade700,
          size: context.height * 0.033,
        ),
        context.emptySizedWidthBoxLow3x,
        Text(
          arguments.date.day.toString() +
              " " +
              DateFormat("MMMM").format(arguments.date) +
              " " +
              arguments.date.year.toString(),
          style: context.textTheme.bodyText1?.copyWith(
            color: Colors.white54,
            fontSize: context.height * 0.021,
          ),
        ),
        context.emptySizedWidthBoxHigh,
        Icon(
          Icons.access_time_outlined,
          color: Colors.pink.shade700,
          size: context.height * 0.033,
        ),
        context.emptySizedWidthBoxLow3x,
        Text(
          DateFormat("hh:mm a").format(arguments.date),
          style: context.textTheme.bodyText1?.copyWith(
            color: Colors.white54,
            fontSize: context.height * 0.021,
          ),
        ),
      ],
    );
  }
}
