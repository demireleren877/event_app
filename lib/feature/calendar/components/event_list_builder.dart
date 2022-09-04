import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/event_model.dart';
import '../../../core/routes/route_constants.dart';
import '../../../core/utilities/scroll_behavior.dart';
import 'event_detail_column.dart';
import 'event_image.dart';

class EventListWidget extends StatelessWidget {
  const EventListWidget({Key? key, required this.eventList, this.docs})
      : super(key: key);
  final List<NeatCleanCalendarEvent> eventList;
  final dynamic docs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.35),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          padding: context.paddingNormal,
          itemCount: eventList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.eventDetail,
                      arguments: Event.fromJson(
                        docs
                            .where((element) =>
                                element.data()['id'].toString() ==
                                eventList[index].description)
                            .first
                            .data(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      EventImage(
                        eventList: eventList,
                        index: index,
                        docs: docs,
                      ),
                      context.emptySizedWidthBoxLow3x,
                      EventDetailColumn(
                        eventList: eventList,
                        index: index,
                      ),
                    ],
                  ),
                ),
                context.emptySizedHeightBoxLow3x
              ],
            );
          },
        ),
      ),
    );
  }
}
