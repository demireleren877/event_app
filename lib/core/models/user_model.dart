import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String profileImageUrl;
  @HiveField(3)
  final List takenTickets;

  User({
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.takenTickets,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      profileImageUrl: json["profileImageUrl"],
      takenTickets: List.from(json['takenTickets']),
    );
  }
}
