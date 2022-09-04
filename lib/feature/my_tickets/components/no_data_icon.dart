import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataIcon extends StatelessWidget {
  const NoDataIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.event_busy,
        color: Colors.white24,
        size: 75.sp,
      ),
    );
  }
}
