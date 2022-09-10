import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/components/centered_progress.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:event_app/feature/sign_up/components/signup_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import '../../core/colors/app_colors.dart';
import '../../core/models/event_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: profileAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: context.horizontalPaddingNormal,
        children: [
          const UserStreamBuilder(),
          context.emptySizedHeightBoxLow3x,
          SignUpButton(
            buttonColor: const Color(0xFF7860E1),
            textColor: Colors.white,
            text: "Profili Düzenle",
            onPressed: () {},
          ),
          context.emptySizedHeightBoxLow3x,
          Text(
            "Son Etkinlikler",
            style: context.textTheme.bodyText2?.copyWith(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w300,
              letterSpacing: 1.2,
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          LastEventStreamBuilder(
              email: FirebaseServices.auth.currentUser!.email ?? ""),
          context.emptySizedHeightBoxNormal,
          Text(
            "Favoriler",
            style: context.textTheme.bodyText2?.copyWith(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w300,
              letterSpacing: 1.2,
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          SizedBox(
            height: 170.h,
            child: ValueListenableBuilder(
              valueListenable: Hive.box("events").listenable(),
              builder: (context, Box movieBox, _) => movieBox.length != 0
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: movieBox.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onLongPress: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //     title: const Text("Favorilerden Çıkar"),
                            //     content: const Text(
                            //         "Bu etkinliği favorilerden çıkarmak istediğinize emin misiniz?"),
                            //     actions: [
                            //       TextButton(
                            //         onPressed: () {
                            //           Navigator.pop(context);
                            //         },
                            //         child: const Text("Hayır"),
                            //       ),
                            //       TextButton(
                            //         onPressed: () {
                            //           movieBox.deleteAt(index);
                            //           Navigator.pop(context);
                            //         },
                            //         child: const Text("Evet"),
                            //       ),
                            //     ],
                            //   ),
                            // );
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text("Favorilerden Çıkar"),
                                content: const Text(
                                    "Bu etkinliği favorilerden çıkarmak istediğinize emin misiniz?"),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text("Hayır"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: const Text("Evet"),
                                    onPressed: () {
                                      movieBox.deleteAt(index);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              EventCardforProfile(
                                event: movieBox.getAt(index),
                              ),
                              DateboxForProfile(
                                date: movieBox.getAt(index).date,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy_outlined,
                          size: 70.sp,
                          color: Colors.white54,
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar profileAppBar(context) => AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/menu");
            },
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

class DateboxForProfile extends StatelessWidget {
  const DateboxForProfile({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: context.width / 25,
      top: context.height * .01,
      child: Container(
        width: 40.w,
        height: 40.w,
        padding: context.paddingLow,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: context.lowBorderRadius,
        ),
        child: Column(
          children: [
            Text(
              DateFormat("MMM").format(date).toUpperCase(),
              style: context.textTheme.bodyText1?.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
            ),
            Text(
              DateFormat("dd").format(date),
              style: context.textTheme.headline6?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LastEventStreamBuilder extends StatelessWidget {
  const LastEventStreamBuilder({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseServices().getEventsforUser(email),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error = ${snapshot.error}');
          }
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return SizedBox(
              height: 170.h,
              child: docs.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy_outlined,
                          size: 70.sp,
                          color: Colors.white54,
                        ),
                      ],
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            EventCardforProfile(
                              event: Event.fromJson(
                                docs[index].data(),
                              ),
                            ),
                            DateboxForProfile(
                              date: Event.fromJson(docs[index].data()).date,
                            ),
                          ],
                        );
                      },
                    ),
            );
          }
          return const CenteredProgressIndicator();
        });
  }
}

class EventCardforProfile extends StatelessWidget {
  const EventCardforProfile({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/eventDetail",
          arguments: event,
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        padding: context.paddingLow,
        alignment: Alignment.bottomLeft,
        height: 200.h,
        width: 170.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: context.lowBorderRadius,
          image: DecorationImage(
            image: NetworkImage(
              event.image ?? "",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: context.verticalPaddingLow,
          width: 120.w,
          child: Text(
            event.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class UserStreamBuilder extends StatelessWidget {
  const UserStreamBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseServices.user
          .doc(FirebaseServices.auth.currentUser!.email)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');
        if (snapshot.hasData) {
          var output = snapshot.data;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: AppColors.transparent,
                    backgroundImage: output["profileImageUrl"] == null
                        ? const AssetImage("assets/image.png") as ImageProvider
                        : NetworkImage(
                            output["profileImageUrl"],
                          ),
                  ),
                  context.emptySizedWidthBoxNormal,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        output["name"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                      context.emptySizedHeightBoxLow,
                      Text(
                        "@" + output["userName"],
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              context.emptySizedHeightBoxLow3x,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "45",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        "Takipçi",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  context.emptySizedWidthBoxLow,
                  Column(
                    children: [
                      Text(
                        "76",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        "Takip Edilen",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
        return const CenteredProgressIndicator();
      },
    );
  }
}
