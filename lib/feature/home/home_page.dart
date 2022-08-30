import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/routes/route_constants.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:event_app/core/utilities/scroll_behavior.dart';
import 'package:event_app/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeVM _homeVM = HomeVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 10,
        centerTitle: true,
        title: const Text("Home"),
      ),
      bottomNavigationBar: Observer(
        builder: (a) => BottomNavigationBar(
          backgroundColor: Colors.black,
          onTap: _homeVM.onTabChange,
          currentIndex: _homeVM.selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30.sp,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.star),
              icon: Icon(Icons.star_border),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.date_range),
              icon: Icon(Icons.date_range_outlined),
              label: "Favs",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.location_on_rounded),
              icon: Icon(Icons.location_on_outlined),
              label: "Search",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.local_activity),
              icon: Icon(Icons.local_activity_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          padding: context.paddingLow,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white54,
                      ),
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: Colors.pink[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: context.width * 0.12,
                        child: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      hintText: "Find Amazing Parties",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            context.emptySizedHeightBoxLow3x,
            Padding(
              padding: context.horizontalPaddingNormal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: context.textTheme.headline5?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "See All",
                    style: context.textTheme.subtitle1?.copyWith(
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
            ),
            context.emptySizedHeightBoxLow3x,
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseServices.events,
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return SizedBox(
                    width: double.infinity,
                    height: context.height / 1.7,
                    child: CarouselSlider.builder(
                      itemCount: docs.length,
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
                        final doc = docs[index];
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
                                              style: context.textTheme.subtitle1
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
                                  context.emptySizedWidthBoxHigh,
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.eventDetail,
                                        arguments: Event.fromJson(doc.data()),
                                      );
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.grey.shade900.withOpacity(0.6),
                                      radius: 30,
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        height: context.height,
                        viewportFraction: .95,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}


/*ListView.builder(
              physics = const BouncingScrollPhysics(),
              itemCount = docs.length,
              itemBuilder = (_, i) {
                final data = docs[i].data();
                return Card(
                  color: Colors.black,
                  child: ListTile(
                    title: Text(
                      data['id'].toString() + '-) ' + data['title'].toString(),
                      style: context.textTheme.headline6?.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    minVerticalPadding: 10,
                    subtitle: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 35,
                      width: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data["peoples"].length,
                        itemBuilder: (BuildContext context, int index) {
                          return CircleAvatar(
                            child: Text(
                              data["peoples"][index]["name"].substring(0, 1),
                              style: context.textTheme.headline6?.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );*/