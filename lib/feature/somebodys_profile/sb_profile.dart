import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/feature/details/details_page.dart';
import 'package:event_app/feature/profile/profile_screen.dart';
import 'package:event_app/feature/somebodys_profile/components/follow_business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../core/colors/app_colors.dart';
import '../../core/components/centered_progress.dart';
import '../../core/models/event_model.dart';
import '../../core/models/user_model.dart';
import '../../core/services/firebase_services.dart';
import '../chat_room/chat_screen.dart';

class SomeBodysProfile extends StatelessWidget {
  SomeBodysProfile({Key? key, required this.user}) : super(key: key);
  final FirebaseServices _firebaseServices = FirebaseServices();
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          FutureBuilder(
            future: _firebaseServices.getCurrentUsername(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return IconButton(
                onPressed: () {
                  showMenu(
                    // this is the line that shows the menu
                    context: context,
                    color: Colors.grey.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: context.normalBorderRadius,
                    ),
                    position: RelativeRect.fromLTRB(500.w, 56.h, 0, 0),
                    items: [
                      PopupMenuItem(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            withNavBar: false,
                            screen: ChatScreen(
                              stream: FirebaseServices.user
                                  .doc(FirebaseServices.auth.currentUser!.email)
                                  .collection("chats")
                                  .doc(user.email)
                                  .collection("messages")
                                  .orderBy("time", descending: true)
                                  .snapshots(),
                              messagePath: FirebaseServices.user
                                  .doc(FirebaseServices.auth.currentUser!.email)
                                  .collection("chats")
                                  .doc(user.email)
                                  .collection("messages"),
                              currentLecture: user.email,
                              currentUser: snapshot.data,
                              isDM: true,
                              dmPath: FirebaseServices.user
                                  .doc(user.email)
                                  .collection("chats")
                                  .doc(FirebaseServices.auth.currentUser!.email)
                                  .collection("messages"),
                              lmdPath: FirebaseServices.user
                                  .doc(user.email)
                                  .collection("chats")
                                  .doc(
                                      FirebaseServices.auth.currentUser!.email),
                              lmPath: FirebaseServices.user
                                  .doc(FirebaseServices.auth.currentUser!.email)
                                  .collection("chats")
                                  .doc(user.email),
                            ),
                          );
                        },
                        child: const Text("Mesaj Gönder"),
                      ),
                      const PopupMenuItem(
                        child: Text("Şikayet Et"),
                      ),
                      const PopupMenuItem(
                        child: Text("Kullanıcıyı Engelle"),
                      ),
                      const PopupMenuItem(
                        child: Text("Bu Profili Paylaş"),
                      ),
                    ],
                  );
                },
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 35.sp,
                ),
              );
            },
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
                            : CachedNetworkImageProvider(
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
                            "@${user.userName}",
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
                                style: context.textTheme.bodyMedium?.copyWith(
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
        PersistentNavBarNavigator.pushNewScreen(context,
            screen: EventDetailsPage(event: event));
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
            image: CachedNetworkImageProvider(
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
