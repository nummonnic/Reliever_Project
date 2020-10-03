import 'package:firebase_helpers/firebase_helpers.dart';
import '../model/feedback.dart';

DatabaseService<FeedbackModel> rateDBS = DatabaseService<FeedbackModel>(
  "feedback-record",
  fromDS: (id, data) => FeedbackModel.fromDS(id, data),
  toMap: (event) => event.toMap(),
);
