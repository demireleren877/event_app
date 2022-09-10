import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'date_data.dart';
import 'party_detail_data.dart';

class PartyCard extends StatelessWidget {
  const PartyCard({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: context.normalBorderRadius,
            image: const DecorationImage(
              image: AssetImage("assets/party.jpg"),
              fit: BoxFit.cover,
            ),
            color: Colors.grey[900],
          ),
        ),
        Positioned(
          left: context.width / 25,
          bottom: context.height / 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PartyDetailData(doc: doc),
            ],
          ),
        ),
        Positioned(
          right: context.width / 25,
          top: context.height * .02,
          child: DateData(doc: doc),
        ),
      ],
    );
  }
}
