import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

class DateData extends StatelessWidget {
  const DateData({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.w,
      padding: context.paddingLow,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: context.normalBorderRadius,
      ),
      child: Column(
        children: [
          Text(
            DateFormat("MMM").format(doc["date"].toDate()).toUpperCase(),
            style: context.textTheme.bodyText1?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
          Text(
            DateFormat("dd").format(doc["date"].toDate()),
            style: context.textTheme.headline5?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
