import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:event_app/core/utilities/scroll_behavior.dart';
import 'package:event_app/feature/home/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import 'components/my_tickets_list.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: buildHomeAppBar(context),
        body: Scaffold(
          backgroundColor: Colors.black,
          appBar: buildAppBar(context),
          body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseServices.auth.currentUser!.email)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: TabBarView(
                      children: [
                        MyTicketList(snapshot: snapshot),
                        MyTicketList(snapshot: snapshot),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.black,
      bottom: TabBar(
        padding: context.paddingNormal,
        labelColor: Colors.amber,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.amber,
        indicator: BoxDecoration(
          borderRadius: context.lowBorderRadius,
          border: Border.all(
            color: Colors.amber,
            width: 2.0,
          ),
        ),
        unselectedLabelStyle:
            context.textTheme.headline6?.copyWith(fontSize: 18.sp),
        labelStyle: context.textTheme.headline6?.copyWith(fontSize: 18.sp),
        tabs: const [
          Tab(
            text: "Active",
          ),
          Tab(
            text: "Past",
          ),
        ],
      ),
    );
  }
}
