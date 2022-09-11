import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/feature/profile/profile_screen.dart';
import 'package:event_app/feature/somebodys_profile/components/follow_business.dart';
import 'package:event_app/feature/somebodys_profile/viewmodel/sb_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../core/colors/app_colors.dart';
import '../../core/components/centered_progress.dart';
import '../../core/models/event_model.dart';
import '../../core/models/user_model.dart';
import '../../core/services/firebase_services.dart';

class SomeBodysProfile extends StatelessWidget {
  SomeBodysProfile({Key? key}) : super(key: key);
  final FirebaseServices _firebaseServices = FirebaseServices();
  final SBSProfileVM _sbsProfileVM = SBSProfileVM();

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
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
      ),
      body: Padding(
        padding: context.horizontalPaddingNormal,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundColor: AppColors.transparent,
                        backgroundImage: user.profileImageUrl == ""
                            ? const AssetImage("assets/image.png")
                                as ImageProvider
                            : NetworkImage(
                                user.profileImageUrl,
                              ),
                      ),
                      context.emptySizedWidthBoxNormal,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            "@" + user.userName,
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
                  FutureBuilder(
                    future: _firebaseServices.amiFollowing(user.email),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return FollowersAndFollowing(
                          firebaseServices: _firebaseServices,
                          user: user,
                          isFollowed: snapshot.data,
                        );
                      }
                      return const CenteredProgressIndicator();
                    },
                  ),
                  context.emptySizedHeightBoxLow3x,
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: StreamBuilder(
                stream: FirebaseServices.user.doc(user.email).snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final docs = snapshot.data;
                    return user.status == "available" ||
                            docs["followers"].contains(
                                FirebaseServices.auth.currentUser!.email)
                        ? Column(
                            children: [
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
                              LastEventStreamBuilderforSb(email: user.email),
                            ],
                          )
                        : Container(
                            margin: context.verticalPaddingHigh,
                            child: Center(
                              child: Icon(
                                Icons.lock_outlined,
                                size: context.height * .2,
                                color: Colors.white54,
                              ),
                            ),
                          );
                  }
                  return const CenteredProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LastEventStreamBuilderforSb extends StatelessWidget {
  const LastEventStreamBuilderforSb({
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
            return docs.isEmpty
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
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          EventCardforProfileforSB(
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
                  );
          }
          return const CenteredProgressIndicator();
        });
  }
}

class EventCardforProfileforSB extends StatelessWidget {
  const EventCardforProfileforSB({
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
        width: context.width * 0.5,
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
