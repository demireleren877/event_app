import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final firestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static final user = FirebaseFirestore.instance.collection("users");
  static final events =
      FirebaseFirestore.instance.collection("events").orderBy("id").snapshots();
  static final forums = FirebaseFirestore.instance.collection("forums");
  forumSnapshots(currentLecture) {
    return forums
        .doc(currentLecture)
        .collection("chats")
        .orderBy("time", descending: true)
        .snapshots();
  }

  getEvents() {
    return firestore.collection("events").orderBy("id").snapshots();
  }

  getEventsforUser() {
    return firestore
        .collection("events")
        .where("attendees", arrayContains: auth.currentUser!.email)
        //.where("date", isLessThan: DateTime.now())
        .snapshots();
  }
}
