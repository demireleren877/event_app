class Event {
  final int id;
  final String title;
  final String detail;
  final List peoples;

  Event(
      {required this.id,
      required this.title,
      required this.detail,
      required this.peoples});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      detail: json['location'],
      peoples: List.from(json['peoples']),
    );
  }
}
