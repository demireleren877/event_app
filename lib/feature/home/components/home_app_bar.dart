import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

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
        icon: Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 25.sp),
      ),
      context.emptySizedWidthBoxLow3x,
    ],
  );
}
