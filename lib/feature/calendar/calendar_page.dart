import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/data/day_of_weeks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/event_list_builder.dart';
import '../../core/components/centered_progress.dart';
import '../../core/services/firebase_services.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({
    Key? key,
  }) : super(key: key);

  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _firebaseServices.getEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return Container(
              color: Colors.black,
              child: ListView(
                children: [
                  Calendar(
                    startOnMonday: true,
                    weekDays: Days.days,
                    eventsList: docs
                        .map(
                          (e) => NeatCleanCalendarEvent(
                            e.data()['title'],
                            description: e.data()["id"].toString(),
                            location: e.data()['location'],
                            startTime: e.data()['date'].toDate(),
                            endTime: e.data()['date'].toDate(),
                            color: Colors.purpleAccent.shade200,
                            isMultiDay: true,
                          ),
                        )
                        .toList(),
                    isExpandable: true,
                    defaultDayColor: Colors.white,
                    eventDoneColor: Colors.green,
                    hideTodayIcon: true,
                    selectedColor: Colors.pink,
                    selectedTodayColor: Colors.pink,
                    todayColor: Colors.blue,
                    eventColor: null,
                    locale: 'tr_TR',
                    isExpanded: true,
                    expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                    datePickerType: DatePickerType.hidden,
                    dayOfWeekStyle: TextStyle(
                      color: Colors.purpleAccent.shade200,
                      fontWeight: FontWeight.w800,
                      fontSize: 14.sp,
                    ),
                    bottomBarArrowColor: Colors.white,
                    bottomBarColor: Colors.grey.shade900,
                    bottomBarTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 14.sp,
                    ),
                    eventListBuilder: (BuildContext context,
                        List<NeatCleanCalendarEvent> eventList) {
                      return EventListWidget(
                        eventList: eventList,
                        docs: docs,
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const CenteredProgressIndicator();
        });
  }
}
