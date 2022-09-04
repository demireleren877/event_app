import 'package:hive_flutter/hive_flutter.dart';
part 'event_model.g.dart';

@HiveType(typeId: 0)
class Event {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String location;
  @HiveField(3)
  final List peoples;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final DateTime date;
  @HiveField(6)
  String? image;

  Event(
      {required this.date,
      required this.id,
      required this.price,
      required this.title,
      required this.location,
      required this.peoples,
      this.image});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      price: json["price"].toDouble(),
      location: json['location'],
      peoples: List.from(json['peoples']),
      date: json['date'].toDate(),
      image: json['image'].toString(),
    );
  }
}
