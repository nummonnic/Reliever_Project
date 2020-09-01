import 'dart:convert';
//import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../widget/chooseClip.dart';
import '../widget/chooseClip2.dart';
import '../widget/chooseClip3.dart';
import 'package:http/http.dart' as http;

class ChooseClipMain extends StatefulWidget {
  @override
  _chooseClipMainState createState() => _chooseClipMainState();
}

class _chooseClipMainState extends State<ChooseClipMain> {
  final dbRef = FirebaseDatabase.instance.reference();
  var lists = new List();
  var timestampList = new List();
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
            timestampList.clear();
            //Map<dynamic, dynamic> values = snapshot.data.value;
            final values =
                json.decode(snapshot.data.body) as Map<String, dynamic>;
            values.forEach((key, value) {
              value.forEach((key, data) {
                if (key == "value")
                  lists.add(data);
                else
                  timestampList.add(data);
              });
            });
            // print(lists);
            var stress = lists[0] +
                lists[1] +
                lists[2] +
                lists[3] +
                lists[4];
            // lists.forEach((value) {
            //   print(value.value);
            // });
            // var stress = 0;
            //var stressPercent = (stress / 15) * 100;
            if (stress >= 8) {
              return ActivityClip3();
              // return Padding(
              //     padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              //     child: Container(
              //         // child: Positioned(
              //         //     left: MediaQuery.of(context).size.width * 0.32,
              //         //     top: MediaQuery.of(context).size.height * 0.11,
              //         width: 150,
              //         height: 150,
              //         child: Container(
              //           decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   image: AssetImage("assets/vstressLevel.png"))),
              //         )
              //         //)
              //         ));
            } else if (stress >= 5) {
              return ActivityClip2();
              // return Padding(
              //     padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              //     child: Container(
              //         // child: Positioned(
              //         //     left: MediaQuery.of(context).size.width * 0.32,
              //         //     top: MediaQuery.of(context).size.height * 0.11,
              //         width: 150,
              //         height: 150,
              //         child: Container(
              //           decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   image: AssetImage("assets/stressLevel.png"))),
              //         )
              //         //)
              //         ));
            } else{
              return ActivityClip();
              // return Padding(
              //     padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              //     child: Container(
              //         // child: Positioned(
              //         //     left: MediaQuery.of(context).size.width * 0.32,
              //         //     top: MediaQuery.of(context).size.height * 0.11,
              //         width: 150,
              //         height: 150,
              //         child: Container(
              //           decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   image: AssetImage("assets/normalLevel.png"))),
              //         )
              //         //)
              //         ));
            } 

            // return new ListView(shrinkWrap: true, children: [
            //   Card(
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Text("Stress Level: " + stress.toString()),
            //         Text("Percent of stress level: " +
            //             stressPercent.toString() +
            //             "%"),
// //                    Text("Answer 1: " + lists[0].toString()),
// //                    Text("Answer 2: " + lists[1].toString()),
// //                    Text("Answer 3: " + lists[2].toString()),
// //                    Text("Answer 4: " + lists[3].toString()),
// //                    Text("Answer 5: " + lists[4].toString()),
            //       ],
            //     ),
            //   )
            // ]);
          }
          return CircularProgressIndicator();
        });
  }
}
