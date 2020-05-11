import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class StressLevelHandler extends StatefulWidget {
  @override
  _stressLevelHandlerState createState() => _stressLevelHandlerState();
}

class _stressLevelHandlerState extends State<StressLevelHandler> {
  final dbRef = FirebaseDatabase.instance.reference();
  var lists = new List();
  final url = "https://reliever-gkkdtw.firebaseio.com/.json";

  @override
  void initState() {
    super.initState();
  }

  // Future<void> FetchStressScore() async {
  //   const url = "https://reliever-gkkdtw.firebaseio.com/";
  //   try {
  //     final response = await http.get(url);
  //     final extract_data = json.decode(response.body) as Map<String, dynamic>;
  //     extract_data.forEach((key, value) {
  //       lists.add(value);
  //     });
  //     return lists;
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: http.get(url),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            //Map<dynamic, dynamic> values = snapshot.data.value;
            final values =
                json.decode(snapshot.data.body) as Map<String, dynamic>;
            values.forEach((key, value) {
              lists.add(value);
            });
            var stress = lists[0] + lists[1] + lists[2] + lists[3] + lists[4];
            var stressPercent = (stress / 25) * 100;
            return new ListView(shrinkWrap: true, children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Stress Level: " + stress.toString()),
                    Text("Percent of stress level: " +
                        stressPercent.toString() +
                        "%"),
//                    Text("Answer 1: " + lists[0].toString()),
//                    Text("Answer 2: " + lists[1].toString()),
//                    Text("Answer 3: " + lists[2].toString()),
//                    Text("Answer 4: " + lists[3].toString()),
//                    Text("Answer 5: " + lists[4].toString()),
                  ],
                ),
              )
            ]);
          }
          return CircularProgressIndicator();
        });
  }
}
