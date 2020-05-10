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
  final url =
      "https://reliever-gkkdtw.firebaseio.com/.json?auth=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNTg5MTE4MTk2LCJpYXQiOjE1ODkxMTQ1OTYsInYiOjB9.bjLgBNB4V0BWWhiNApSeUBvpq6lGot014QnXHoTy3XA&download=reliever-gkkdtw-export.json&format=export&print=pretty";

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
            return new ListView(shrinkWrap: true, children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Answer 1: " + lists[0].toString()),
                    Text("Answer 2: " + lists[1].toString()),
                    Text("Answer 3: " + lists[2].toString()),
                    Text("Answer 4: " + lists[3].toString()),
                    Text("Answer 5: " + lists[4].toString()),
                  ],
                ),
              )
            ]);
          }
          return CircularProgressIndicator();
        });
  }
}
