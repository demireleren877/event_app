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
  final List<int> takenTickets;
  @HiveField(4)
  final String userName;
  @HiveField(5)
  final String status;
  @HiveField(6)
  final DateTime birthDate;
  @HiveField(7)
  final String phoneNumber;

  User(
      {required this.birthDate,
      required this.status,
      required this.userName,
      required this.name,
      required this.email,
      required this.profileImageUrl,
      required this.takenTickets,
      required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phoneNumber: json['phoneNumber'],
      birthDate: json['birthDate'].toDate(),
      status: json['status'],
      name: json['name'],
      userName: json['userName'],
      email: json['email'],
      profileImageUrl: json["profileImageUrl"],
      takenTickets: List.from(json['takenTickets']),
    );
  }
}
