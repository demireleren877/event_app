import 'package:event_app/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../core/routes/route_constants.dart';
import '../../chat_room/chat_screen.dart';

class RightChild extends StatelessWidget {
  const RightChild({Key? key, this.data, required this.index})
      : super(key: key);

  final dynamic data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FutureBuilder(
          future: FirebaseServices().getCurrentUsername(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return IconButton(
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: ChatScreen(
                    currentUser: snapshot.data,
                    currentLecture: data["title"].toString(),
                    stream: FirebaseServices().forumSnapshots(data["title"]),
                    messagePath: FirebaseServices.forums
                        .doc(data["title"].toString())
                        .collection("chats"),
                    isDM: false,
                    lmPath:
                        FirebaseServices.forums.doc(data["title"].toString()),
                  ),
                  withNavBar: false,
                );
              },
              icon: const Icon(Icons.chat_outlined),
              iconSize: context.height * 0.045,
            );
          },
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.ticket);
          },
          icon: const Icon(Icons.qr_code_rounded),
          iconSize: context.height * 0.045,
        )
      ],
    );
  }
}
