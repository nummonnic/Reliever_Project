import 'package:firebase_helpers/firebase_helpers.dart';

class FeedbackModel extends DatabaseItem{
  final String id;
  final String rate;
  final DateTime rateDate;

  FeedbackModel({this.id, this.rate, this.rateDate}):super(id);

  factory FeedbackModel.fromMap(Map data) {
    return FeedbackModel(
      rate: data['rate'],
      rateDate: data['rate_date'],
    );
  }

  factory FeedbackModel.fromDS(String id, Map<String,dynamic> data) {
    return FeedbackModel(
      id: id,
      rate: data['rate'],
      rateDate: data['rate_date'].toDate(),
    );
  }

  Map<String,dynamic> toMap() {
    return {
      "rate": rate,
      "rate_date":rateDate,
      "id":id,
    };
  }
}