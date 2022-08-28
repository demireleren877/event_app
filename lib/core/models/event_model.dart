import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final int id;
  final String title;
  final String detail;
  final List peoples;
  final double price;
  final Timestamp date;

  Event(
      {required this.date,
      required this.id,
      required this.price,
      required this.title,
      required this.detail,
      required this.peoples});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      price: json["price"].toDouble(),
      detail: json['location'],
      peoples: List.from(json['peoples']),
      date: json['date'],
    );
  }
}
