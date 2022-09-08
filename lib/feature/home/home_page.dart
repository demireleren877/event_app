import 'package:kartal/kartal.dart';
import 'package:event_app/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'components/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeVM _homeVM = HomeVM();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar:
            _homeVM.selectedIndex == 4 ? profileAppBar() : buildAppBar(context),
        bottomNavigationBar: BottomNavBar(homeVM: _homeVM),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _homeVM.pageController,
          children: _homeVM.pages,
        ),
      );
    });
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
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30.sp,
          ),
        ),
        context.emptySizedWidthBoxLow3x,
      ],
    );
  }

  AppBar profileAppBar() => AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 35.sp,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      );
}
