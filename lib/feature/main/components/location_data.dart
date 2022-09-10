import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LocationData extends StatelessWidget {
  const LocationData({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: Colors.pink,
          size: 30,
        ),
        SizedBox(
          width: context.width / 2,
          child: Text(
            doc["location"],
            style: context.textTheme.subtitle1?.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
