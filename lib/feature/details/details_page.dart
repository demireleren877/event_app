import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/utilities/scroll_behavior.dart';
import 'package:flutter/material.dart';

import 'components/event_footer.dart';
import 'components/event_header.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Event;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              EventHeader(arguments: arguments),
              EventFooter(arguments: arguments),
            ],
          ),
        ),
      ),
    );
  }
}
