import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:event_app/feature/ticket/ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../chat_room/chat_screen.dart';

class RightChild extends StatelessWidget {
  const RightChild({Key? key, this.data, required this.index})
      : super(key: key);

  final dynamic data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseServices()
          .getUserData(FirebaseServices.auth.currentUser!.email!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: ChatScreen(
                    currentUser: snapshot.data['name'],
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
            ),
            IconButton(
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: TicketPage(
                    event: Event.fromJson(data),
                    username: snapshot.data['name'],
                    phoneNo: snapshot.data['phoneNumber'],
                  ),
                );
              },
              icon: const Icon(Icons.qr_code_rounded),
              iconSize: context.height * 0.045,
            )
          ],
        );
      },
    );
  }
}
