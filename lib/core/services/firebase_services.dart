import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final firestore = FirebaseFirestore.instance;
  static final user = FirebaseFirestore.instance.collection("users");
  static final events =
      FirebaseFirestore.instance.collection("events").orderBy("id").snapshots();
  static final users = FirebaseFirestore.instance
      .collection("users")
      .doc("demireleren877@gmail.com")
      .snapshots();
  static final forums = FirebaseFirestore.instance.collection("forums");
  forumSnapshots(currentLecture) {
    return forums
        .doc(currentLecture)
        .collection("chats")
        .orderBy("time", descending: true)
        .snapshots();
  }
}
