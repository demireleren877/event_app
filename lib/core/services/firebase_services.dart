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

  sendFollowRequest(String userId) {
    user.doc(userId).update({
      "followRequests": FieldValue.arrayUnion([auth.currentUser!.email])
    });
  }

  unSendFollowRequest(String userId) {
    user.doc(userId).update({
      "followRequests": FieldValue.arrayRemove([auth.currentUser!.email])
    });
  }

  amiSentFollowRequest(String userId) {
    return user.doc(userId).get().then((value) =>
        value.data()!["followRequests"].contains(auth.currentUser!.email));
  }

  acceptFollowRequest(String userId) {
    user.doc(auth.currentUser!.email).update({
      "followers": FieldValue.arrayUnion([userId])
    });
    user.doc(userId).update({
      "following": FieldValue.arrayUnion([auth.currentUser!.email])
    });
    user.doc(auth.currentUser!.email).update({
      "followRequests": FieldValue.arrayRemove([userId])
    });
  }

  unAcceptFollowRequest(String userId) {
    user.doc(auth.currentUser!.email).update({
      "followers": FieldValue.arrayRemove([userId])
    });
    user.doc(userId).update({
      "following": FieldValue.arrayRemove([auth.currentUser!.email])
    });
  }

  followUser(String userId) {
    user.doc(auth.currentUser!.email).update({
      "following": FieldValue.arrayUnion([userId])
    });
    user.doc(userId).update({
      "followers": FieldValue.arrayUnion([auth.currentUser!.email])
    });
  }

  getFollowersCount(String userId) {
    return user
        .doc(userId)
        .get()
        .then((value) => value.data()!["followers"].length);
  }

  getFollowingCount(String userId) {
    return user
        .doc(userId)
        .get()
        .then((value) => value.data()!["following"].length);
  }

  amiFollowing(String userId) {
    return user
        .doc(auth.currentUser!.email)
        .get()
        .then((value) => value.data()!["following"].contains(userId));
  }

  unfollowUser(String userId) {
    user.doc(auth.currentUser!.email).update({
      "following": FieldValue.arrayRemove([userId])
    });
    user.doc(userId).update({
      "followers": FieldValue.arrayRemove([auth.currentUser!.email])
    });
  }

  getFollowRequestsNames(String docId) {
    return user.doc(docId).get().then((value) => value.data()!["userName"]);
  }

  getEvents() {
    return firestore.collection("events").orderBy("id").snapshots();
  }

  getEventsforUser(String email) {
    return firestore
        .collection("events")
        .where("attendees", arrayContains: email)
        //.where("date", isLessThan: DateTime.now())
        .snapshots();
  }

  getUsersForEvent(int id) {
    return firestore
        .collection("users")
        .where("takenTickets", arrayContains: id)
        .snapshots();
  }

  getCurrentUsername() {
    return user
        .doc(FirebaseServices.auth.currentUser!.email)
        .get()
        .then((value) => value.data()!["name"]);
  }

  getUserData(String email) {
    return user.doc(email).get().then((value) => value.data());
  }

  deleteDM(peerId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseServices.auth.currentUser!.email)
        .collection('chats')
        .doc(peerId)
        .delete();
  }

  buyTicket(int eventId) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseServices.auth.currentUser!.email)
        .update({
      "takenTickets": FieldValue.arrayUnion([eventId])
    });

    FirebaseFirestore.instance
        .collection("events")
        .where("id", isEqualTo: eventId)
        .get()
        .then((value) {
      FirebaseFirestore.instance
          .collection("events")
          .doc(value.docs[0].id)
          .update({
        "attendees":
            FieldValue.arrayUnion([FirebaseServices.auth.currentUser!.email])
      });
    });
  }
}
