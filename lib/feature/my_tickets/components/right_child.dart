import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

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
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(
                  currentUser: "deneme",
                  currentLecture: data["title"].toString(),
                ),
              ),
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
}
