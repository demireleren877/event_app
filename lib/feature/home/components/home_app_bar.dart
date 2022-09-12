import 'package:event_app/feature/follow_requests/follow_requests_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

AppBar buildHomeAppBar(BuildContext context) {
  return AppBar(
    leadingWidth: context.width * 0.5,
    leading: Center(
      child: Text(
        DateFormat("    dd MMM yyyy").format(DateTime.now()),
        style: TextStyle(
          color: Colors.white54,
          fontSize: 18.sp,
        ),
      ),
    ),
    backgroundColor: Colors.black,
    actions: [
      IconButton(
        onPressed: () {
          if (ModalRoute.of(context)!.settings.name != "/followRequests") {
            pushNewScreenWithRouteSettings(
              context,
              settings: const RouteSettings(name: "/followRequests"),
              screen: FollowRequestsPage(),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        },
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
          size: 25.sp,
        ),
      ),
      context.emptySizedWidthBoxLow3x,
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 25.sp),
      ),
      context.emptySizedWidthBoxLow3x,
    ],
  );
}

class FollowRequestsScreen {}
