import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final firestore = FirebaseFirestore.instance;
  static final events =
      FirebaseFirestore.instance.collection("events").orderBy("id").snapshots();
}
