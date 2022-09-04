import 'package:event_app/feature/home/viewmodel/home_viewmodel.dart';
import 'package:event_app/feature/my_tickets/my_tickets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../calendar/calendar_page.dart';
import '../main/main_page.dart';
import 'components/bottom_navbar.dart';
import 'components/profile_image.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeVM _homeVM = HomeVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBar(context),
      bottomNavigationBar: BottomNavBar(homeVM: _homeVM),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _homeVM.pageController,
        children: [
          MainScreen(),
          Container(),
          CalendarScreen(),
          const MyTickets(),
          Container(),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
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
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 25.sp,
          ),
        ),
        context.emptySizedWidthBoxLow3x,
        IconButton(
          onPressed: () {},
          icon:
              Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 25.sp),
        ),
        context.emptySizedWidthBoxLow3x,
        const AppBarProfileImage(),
        context.emptySizedWidthBoxLow3x,
      ],
    );
  }
}
