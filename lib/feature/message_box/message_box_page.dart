import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/feature/chat_room/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../core/components/centered_progress.dart';
import '../../core/services/firebase_services.dart';

class MessageBox extends StatelessWidget {
  MessageBox({Key? key, required this.currentUserName}) : super(key: key);
  final String currentUserName;
  final FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: FirebaseServices.user
            .doc(FirebaseServices.auth.currentUser!.email)
            .collection("chats")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      context.emptySizedHeightBoxHigh,
                      Padding(
                        padding: context.horizontalPaddingMedium,
                        child: Text(
                          "Mesaj Kutusu",
                          style: context.textTheme.headline4!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      context.emptySizedHeightBoxLow3x,
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: context.horizontalPaddingNormal,
                    itemCount: docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = docs[index];
                      return FutureBuilder(
                        future: _firebaseServices.getUserData(data.id),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListTile(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  withNavBar: false,
                                  screen: ChatScreen(
                                    currentLecture: data.id,
                                    currentUser: currentUserName,
                                    stream: FirebaseServices.user
                                        .doc(FirebaseServices
                                            .auth.currentUser!.email)
                                        .collection("chats")
                                        .doc(data.id)
                                        .collection("messages")
                                        .orderBy("time", descending: true)
                                        .snapshots(),
                                    messagePath: FirebaseServices.user
                                        .doc(FirebaseServices
                                            .auth.currentUser!.email)
                                        .collection("chats")
                                        .doc(data.id)
                                        .collection("messages"),
                                    isDM: true,
                                    dmPath: FirebaseServices.user
                                        .doc(data.id)
                                        .collection("chats")
                                        .doc(FirebaseServices
                                            .auth.currentUser!.email)
                                        .collection("messages"),
                                    lmPath: FirebaseServices.user
                                        .doc(FirebaseServices
                                            .auth.currentUser!.email)
                                        .collection("chats")
                                        .doc(data.id),
                                    lmdPath: FirebaseServices.user
                                        .doc(data.id)
                                        .collection("chats")
                                        .doc(FirebaseServices
                                            .auth.currentUser!.email),
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                radius: context.width * 0.07,
                                backgroundImage: CachedNetworkImageProvider(
                                  snapshot.data['profileImageUrl'],
                                ),
                              ),
                              title: Padding(
                                padding: context.verticalPaddingLow,
                                child: Text(
                                  snapshot.data['name'],
                                  style: context.textTheme.headline6!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              horizontalTitleGap: context.width * 0.05,
                              minVerticalPadding: 0,
                              subtitle: Row(
                                children: [
                                  data["senderId"] ==
                                          FirebaseServices
                                              .auth.currentUser!.email
                                      ? Row(
                                          children: [
                                            data["read"] == true
                                                ? Icon(
                                                    Icons.done_all,
                                                    color: Colors.green,
                                                    size: context.width * 0.04,
                                                  )
                                                : Icon(
                                                    Icons.done,
                                                    color: Colors.white,
                                                    size: context.width * 0.04,
                                                  ),
                                            context.emptySizedWidthBoxLow3x,
                                          ],
                                        )
                                      : const SizedBox(),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: context.width * 0.3,
                                    ),
                                    child: Text(
                                      data['lastMessage'],
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.subtitle2!
                                          .copyWith(color: Colors.white70),
                                    ),
                                  ),
                                  context.emptySizedWidthBoxLow,
                                  Text(
                                    DateTime.now()
                                                .difference(
                                                    data['lastMessageTime']
                                                        .toDate())
                                                .inDays >
                                            0
                                        ? DateFormat('dd.MM.yyyy').format(
                                            data['lastMessageTime'].toDate())
                                        : DateFormat('HH:mm').format(
                                            data['lastMessageTime'].toDate()),
                                  ),
                                ],
                              ),
                              trailing: SizedBox(
                                height: double.infinity,
                                child: IconButton(
                                  splashRadius: 1,
                                  onPressed: () {
                                    _firebaseServices.deleteDM(data.id);
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                    size: context.width * 0.1,
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const CenteredProgressIndicator();
        },
      ),
    );
  }
}
