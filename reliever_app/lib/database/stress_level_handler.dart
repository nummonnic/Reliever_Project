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
  var timestampList = new List();
  final url = "https://reliever-gkkdtw.firebaseio.com/.json";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(url),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          lists.clear();
          timestampList.clear();

          final values =
              json.decode(snapshot.data.body) as Map<String, dynamic>;
          values.forEach(
            (key, value) {
              value.forEach(
                (key, data) {
                  if (key == "value")
                    lists.add(data);
                  else
                    timestampList.add(data);
                },
              );
            },
          );

          var stress = lists[0] + lists[1] + lists[2] + lists[3] + lists[4];
          if (stress >= 8) {
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: 120,
                height: 120,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/stressLevel.png"))),
                ),
              ),
            );
          } else if (stress >= 5) {
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: 150,
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/normalLevel.png"))),
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: 120,
                height: 120,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/happyLevel.png"))),
                ),
              ),
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
