import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'location_data.dart';

class PartyDetailData extends StatelessWidget {
  const PartyDetailData({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doc["title"],
          style: context.textTheme.headline5?.copyWith(
            color: Colors.white,
          ),
        ),
        context.emptySizedHeightBoxLow,
        LocationData(doc: doc),
      ],
    );
  }
}
