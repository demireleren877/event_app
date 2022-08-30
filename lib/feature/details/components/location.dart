import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/event_model.dart';

class Location extends StatelessWidget {
  const Location({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final Event arguments;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          color: Colors.pink.shade700,
          size: context.height * 0.033,
        ),
        context.emptySizedWidthBoxLow3x,
        Text(
          arguments.detail,
          style: context.textTheme.bodyText1?.copyWith(
            color: Colors.white54,
            fontSize: context.height * 0.021,
          ),
        ),
      ],
    );
  }
}
