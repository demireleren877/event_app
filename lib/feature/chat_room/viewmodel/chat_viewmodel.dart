import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import '../../../core/services/firebase_services.dart';
part 'chat_viewmodel.g.dart';

class ChatVM = _ChatVMBase with _$ChatVM;

abstract class _ChatVMBase with Store {
  @observable
  File? imageFile;

  @action
  sendMessage(messageController, scrollController, currentUser, currentLecture,
      messagePath, isDM, dmPath, lmPath, lmdPath) {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "senderID": FirebaseServices.auth.currentUser!.email,
        "senderId": currentUser,
        "type": "text",
        "read": false,
        "time": DateTime.now(),
      };
      // FirebaseFirestore.instance
      //     .collection("forums")
      //     .doc(currentLecture)
      //     .collection("chats")
      messagePath.add(messageMap).then((value) {
        lmPath.set({
          "lastMessage": messageMap["message"],
          "lastMessageTime": DateTime.now(),
          "senderId": FirebaseServices.auth.currentUser!.email,
          "read": false,
        });
      });
      if (isDM) {
        dmPath.add(messageMap).then((value) {
          lmdPath.set({
            "lastMessage": messageMap["message"],
            "lastMessageTime": DateTime.now(),
            "senderId": FirebaseServices.auth.currentUser!.email,
            "read": false,
          });
        });
      }

      messageController.text = "";
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
    scrollController.jumpTo(0.0);
  }

  Future<void> seeMsg(String peerId) async {
    final query2 = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseServices.auth.currentUser!.email)
        .collection('chats')
        .doc(peerId)
        .get();

    if (query2.exists && query2["senderId"] == peerId) {
      query2.reference.update({"read": true});
    }

    final query3 = await FirebaseFirestore.instance
        .collection('users')
        .doc(peerId)
        .collection('chats')
        .doc(FirebaseServices.auth.currentUser!.email)
        .get();

    if (query3.exists && query3["senderId"] == peerId) {
      query3.reference.update({"read": true});
    }
  }

  @action
  bool isByMe(snapshot, index) {
    if (snapshot.data.docs[index].data()["senderID"] ==
        FirebaseServices.auth.currentUser!.email) {
      return true;
    } else {
      return false;
    }
  }

  @action
  sendImage(currentLecture, currentUser, messagePath, isDM, dmPath) async {
    ImagePicker _picker = ImagePicker();
    await _picker.pickImage(source: ImageSource.camera).then((xFile) => {
          if (xFile != null)
            {
              imageFile = File(xFile.path),
              uploadImage(
                  currentLecture, currentUser, messagePath, isDM, dmPath),
            }
        });
  }

  @action
  Future uploadImage(
      currentLecture, currentUser, messagePath, isDM, dmPath) async {
    String fileName = const Uuid().v1();

    var ref =
        FirebaseStorage.instance.ref().child("images").child("$fileName.jpg");
    var uploadTask = await ref.putFile(imageFile!).catchError((error) async {});
    String imageUrl = await uploadTask.ref.getDownloadURL();
    await messagePath.add({
      "message": imageUrl,
      "senderID": FirebaseServices.auth.currentUser!.email,
      "senderId": currentUser,
      "type": "img",
      "time": DateTime.now().millisecondsSinceEpoch.toString(),
    });
    if (isDM) {
      await dmPath.add({
        "message": imageUrl,
        "senderID": FirebaseServices.auth.currentUser!.email,
        "senderId": currentUser,
        "type": "img",
        "time": DateTime.now().millisecondsSinceEpoch.toString(),
      });
    }
  }
}
