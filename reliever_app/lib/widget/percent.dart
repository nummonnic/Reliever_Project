import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
//import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentHandler extends StatefulWidget {
  @override
  _percentHandlerState createState() => _percentHandlerState();
}

class _percentHandlerState extends State<PercentHandler> {
  final dbRef = FirebaseDatabase.instance.reference();
  var lists = new List();
  var timestampList = new List();
  final url = "https://reliever-gkkdtw.firebaseio.com/.json";
  String stressName = "";

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
            var stress = lists[0] + lists[1] + lists[2] + lists[3] + lists[4];
            // lists.forEach((value) {
            //   print(value.value);
            // });
            // var stress = 0;
            double percent = (stress / 15);
            double percentText = percent * 100;
            if (stress >= 10) {
              stressName = "Very stress";
            } else if (stress >= 8) {
              stressName = "Middle stress";
            } else if (stress >= 5) {
              stressName = "Normal";
            } else {
              stressName = "Happy";
            }
            var percentTextShow = percentText.toStringAsFixed(2);
            //var percentText = percent.toString();
            return Column(
              children: <Widget>[
                CircularPercentIndicator(
                  radius: 200.0,
                  progressColor: Color(0xffa14e2d),
                  percent: percent,
                  animation: true,
                  lineWidth: 15,
                  circularStrokeCap: CircularStrokeCap.round,
                  //center: Text(percentText,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

                  // center: Text(
                  //   percentTextShow + "%",
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    stressName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            );
            //             center: Text(
            //   percentTextShow + "%",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            // )

            //  Container(
            // alignment: Alignment(0, 0),
            // child: Text(percentText+"%"))

            //       return

            //           Container(
            //             height: 300,
            //             width: 300,
            //             child: SfRadialGauge(
            //  axes:<RadialAxis>[RadialAxis(minimum: 0, maximum: 100,
            //  axisLineStyle: AxisLineStyle(thickness: 0.1,
            //           thicknessUnit: GaugeSizeUnit.factor,
            //             gradient: const SweepGradient(
            //                 colors: <Color>[Color(0xFFFF7676), Color(0xFFF54EA2)],
            //                 stops: <double>[0.25, 0.75]
            //             ),
            //           ),
            //          pointers: <GaugePointer>[
            //            //RangePointer(value: percent, ),
            //              MarkerPointer(value: percent, color: Colors.black),
            //              //NeedlePointer(value: percent)
            //             ],
            //             annotations: <GaugeAnnotation>[
            // GaugeAnnotation(angle: 270, positionFactor: 0.15,
            // widget: Text(percent.toStringAsFixed(2)+'%', style: TextStyle(fontWeight: FontWeight.bold,
            //     fontSize: 20),))]
            //           )],
            //  )

            //           );

          }
          return CircularProgressIndicator();
        });
  }
}
