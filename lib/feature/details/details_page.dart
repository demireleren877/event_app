import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/utilities/scroll_behavior.dart';
import 'package:flutter/material.dart';

import 'components/event_footer.dart';
import 'components/event_header.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({Key? key, required this.event}) : super(key: key);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              EventHeader(arguments: event),
              EventFooter(arguments: event),
            ],
          ),
        ),
      ),
    );
  }
}
