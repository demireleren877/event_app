import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/feature/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../core/models/event_model.dart';
import 'party_card.dart';

class PartySlider extends StatelessWidget {
  const PartySlider({
    Key? key,
    required this.docs,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.height / 2.9,
      child: CarouselSlider.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index, int pageViewIndex) {
          final doc = docs[index];
          return GestureDetector(
            onTap: () {
              pushNewScreen(
                context,
                screen: EventDetailsPage(
                  event: Event.fromJson(doc.data()),
                ),
              );
            },
            child: PartyCard(doc: doc),
          );
        },
        options: CarouselOptions(
          height: context.height * 0.35,
          viewportFraction: .85,
          enableInfiniteScroll: true,
          autoPlay: true,
          disableCenter: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
