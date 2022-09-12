import 'package:event_app/feature/chat_room/viewmodel/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../core/routes/route_constants.dart';
import '../../chat_room/chat_screen.dart';

class RightChild extends StatelessWidget {
  RightChild({Key? key, this.data, required this.index}) : super(key: key);

  final dynamic data;
  final int index;
  final ChatVM _chatVM = ChatVM();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _chatVM.getCurrentUsername(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  pushNewScreen(
                    context,
                    screen: ChatScreen(
                      currentUser: snapshot.data,
                      currentLecture: data["title"].toString(),
                    ),
                    withNavBar: false,
                  );
                },
                icon: const Icon(Icons.chat_outlined),
                iconSize: context.height * 0.045,
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
        return const SizedBox.shrink();
      },
    );
  }
}
