import 'package:firebase_helpers/firebase_helpers.dart';

class EventModel extends DatabaseItem {
  final String id;
  final String emotion;
  final String description;
  final DateTime eventDate;

  

  EventModel({this.id, this.emotion, this.description, this.eventDate,})
      : super(id);

  factory EventModel.fromMap(Map data) {
    return EventModel(
      emotion: data['emotion'],
      description: data['description'],
      eventDate: data['event_date'],
    );
  }

  factory EventModel.fromDS(String id, Map<String, dynamic> data) {
    return EventModel(
      id: id,
      emotion: data['emotion'],
      description: data['description'],
      eventDate: data['event_date'].toDate(),
      
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "emotion": emotion,
      "description": description,
      "event_date": eventDate,
      "id": id,
     
    };
  }
}
