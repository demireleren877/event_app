class Event {
  final int id;
  final String title;
  final String detail;

  Event({required this.id, required this.title, required this.detail});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      detail: json['detail'],
    );
  }
}
