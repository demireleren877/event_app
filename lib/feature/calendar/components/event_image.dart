import 'package:flutter/cupertino.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

class EventImage extends StatelessWidget {
  const EventImage(
      {Key? key, this.docs, required this.eventList, required this.index})
      : super(key: key);
  final dynamic docs;
  final List<NeatCleanCalendarEvent> eventList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.lowBorderRadius,
      child: Image.network(
        docs
            .where((element) =>
                element.data()['id'].toString() == eventList[index].description)
            .first
            .data()['image']
            .toString(),
        fit: BoxFit.cover,
        width: 150.sp,
      ),
    );
  }
}
