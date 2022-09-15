import 'package:flutter/material.dart';

import '../viewmodel/chat_viewmodel.dart';

class SendPhotoButton extends StatelessWidget {
  const SendPhotoButton({
    Key? key,
    required this.context,
    required this.chatVM,
    this.currentLecture,
    this.currentUser,
    required this.messagePath,
    required this.isDM,
    this.dmPath,
  }) : super(key: key);

  final BuildContext context;
  final ChatVM chatVM;
  final String? currentLecture;
  final String? currentUser;
  final dynamic messagePath;
  final bool isDM;
  final dynamic dmPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.camera_alt_outlined,
        color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.64),
      ),
      onPressed: () => chatVM.sendImage(
        currentLecture,
        currentUser,
        messagePath,
        isDM,
        dmPath,
      ),
    );
  }
}
