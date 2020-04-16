class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime eventDate;

  EventModel({this.id, this.title, this.description, this.eventDate});

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "event_date": eventDate,
      "id": id,
    };
  }
}
