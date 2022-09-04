import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/components/centered_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../core/cache/cache_manager.dart';
import '../../core/models/event_model.dart';
import '../../core/routes/route_constants.dart';
import '../../core/services/firebase_services.dart';
import '../../core/utilities/scroll_behavior.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
  }) : super(key: key);
  final CacheManager _cacheManager = CacheManager();
  final FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _firebaseServices.getEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView(
                padding: context.paddingLow,
                children: [
                  Padding(
                    padding: context.horizontalPaddingNormal,
                    child: Text(
                      "Merhaba ${_cacheManager.getUser()} ",
                      style: context.textTheme.headline4,
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      context.emptySizedWidthBoxLow3x,
                      SizedBox(
                        width: context.width * 0.75,
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white54,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade900,
                            hintText: "Find Amazing Parties",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: context.normalBorderRadius,
                            ),
                          ),
                        ),
                      ),
                      context.emptySizedWidthBoxLow3x,
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on_outlined),
                        iconSize: context.height * 0.05,
                        color: Colors.pink.shade600,
                      )
                    ],
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Padding(
                    padding: context.horizontalPaddingNormal,
                    child: Text(
                      "FEATURED",
                      style: context.textTheme.bodyText2?.copyWith(
                        color: Colors.white,
                        fontSize: context.width * 0.04,
                      ),
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  SizedBox(
                    width: double.infinity,
                    height: context.height / 2.9,
                    child: CarouselSlider.builder(
                      itemCount: docs.length,
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
                        final doc = docs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.eventDetail,
                              arguments: Event.fromJson(doc.data()),
                            );
                          },
                          child: Stack(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doc["title"],
                                          style: context.textTheme.headline5
                                              ?.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        context.emptySizedHeightBoxLow,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                style: context
                                                    .textTheme.subtitle1
                                                    ?.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: context.width / 25,
                                top: context.height * .02,
                                child: Container(
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
                                        DateFormat("MMM")
                                            .format(doc["date"].toDate())
                                            .toUpperCase(),
                                        style: context.textTheme.bodyText1
                                            ?.copyWith(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Text(
                                        DateFormat("dd")
                                            .format(doc["date"].toDate()),
                                        style: context.textTheme.headline5
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Padding(
                    padding: context.horizontalPaddingNormal,
                    child: Text(
                      "FOR YOU",
                      style: context.textTheme.bodyText2?.copyWith(
                        color: Colors.white,
                        fontSize: context.width * 0.04,
                      ),
                    ),
                  ),
                  Container(
                    height: context.height * 0.25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/paket.png"),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return const CenteredProgressIndicator();
        });
  }
}
