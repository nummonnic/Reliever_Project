import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../database/feedback_firestore_service.dart';
import '../model/feedback.dart';

class DetailFeedback extends StatefulWidget {
  DetailFeedback({Key key}) : super(key: key);

  @override
  _DetailFeedbackState createState() => _DetailFeedbackState();
}

class _DetailFeedbackState extends State<DetailFeedback> {
  double xOffset = 0; //set X axis and Y axis
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  Map<String, double> data = new Map();
  bool _loadChart = false;
  DateTime _date;
  Map<String, double> map = Map();
  Map<String, double> _feedback = Map();
  var test = "";
  var listRates = [];
  var listResults = [];
  var datas;
  var elements;

  @override
  void initState() {
    _date = new DateTime.now();
    _feedback = {};
    super.initState();
  }

  groupRate(List<FeedbackModel> feedbacks) {
    Map<String, double> map = Map();
    Map<String, double> resultRates = Map();
    var rates = ["Calm", "Happy", "Surprised", "Funny", "Unknown"];
    feedbacks.forEach(
      (feedback) {
        DateTime date = DateTime(feedback.rateDate.month, 12);

        if (!map.containsKey(feedback.rate)) {
          map[feedback.rate] = 1;
        } else {
          map[feedback.rate] += 1;
        }
      },
    );
    resultRates = map;
    rates.forEach(
      (rate) {
        if (!resultRates.containsKey(rate)) {
          resultRates[rate] = 0;
        }
      },
    );

    return resultRates;
  }

  List<Color> _colors = [
    Colors.teal,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent,
    Colors.grey
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<FeedbackModel>>(
        stream: rateDBS.streamList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FeedbackModel> allFeedbacks = snapshot.data;
            if (allFeedbacks.isNotEmpty) {
              datas = allFeedbacks;
              _feedback = groupRate(allFeedbacks);
            } else {
              _feedback = {"f": 1, "g": 1, "h": 3};
            }
          } else {
            _feedback = {"f": 2, "g": 1, "h": 4};
          }
          return Container(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
              ),
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor),
              duration: Duration(milliseconds: 250),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 15.0),
                        child: Row(
                          children: [
                            isDrawerOpen
                                ? IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(
                                        () {
                                          xOffset = 0;
                                          yOffset = 0;
                                          scaleFactor = 1;
                                          isDrawerOpen = false;
                                        },
                                      );
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(
                                      Icons.menu,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(
                                        () {
                                          xOffset = 230;
                                          yOffset = 150;
                                          scaleFactor = 0.6;
                                          isDrawerOpen = true;
                                        },
                                      );
                                    },
                                  )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Report Summary of feedback',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "data",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            _loadChart
                                ? PieChart(
                                    dataMap: data,
                                    colorList: _colors,
                                    animationDuration:
                                        Duration(milliseconds: 1500),
                                    chartLegendSpacing: 32.0,
                                    chartRadius:
                                        MediaQuery.of(context).size.width / 2.7,
                                    showChartValuesInPercentage: true,
                                    showChartValues: true,
                                    showChartValuesOutside: false,
                                    chartValueBackgroundColor: Colors.grey[200],
                                    showLegends: true,
                                    legendPosition: LegendPosition.right,
                                    decimalPlaces: 1,
                                    showChartValueLabel: true,
                                    initialAngle: 0,
                                    chartValueStyle:
                                        defaultChartValueStyle.copyWith(
                                      color:
                                          Colors.blueGrey[900].withOpacity(0.9),
                                    ),
                                    chartType: ChartType.disc,
                                  )
                                : SizedBox(
                                    height: 150,
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: RaisedButton(
                                color: Color(0xff27496d),
                                child: Text(
                                  'Click to Show Chart',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      _loadChart = true;
                                      data.addAll(
                                        {
                                          'Calm': _feedback["Calm"].toDouble(),
                                          'Happy':
                                              _feedback["Happy"].toDouble(),
                                          'Surprised':
                                              _feedback["Surprised"].toDouble(),
                                          'Funny':
                                              _feedback["Funny"].toDouble(),
                                          'Unknown':
                                              _feedback["Unknown"].toDouble(),
                                        },
                                      );
                                    },
                                  );
                                  print(_feedback);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Color(0xfffe3dfc8),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DataTable(
                                    columns: <DataColumn>[
                                      DataColumn(
                                        label: Text(
                                          "Feedback",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Number",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: <DataRow>[
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(
                                            Text(
                                              "Calm",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              _feedback["Calm"].toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(
                                            Text(
                                              "Happy",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              _feedback["Happy"].toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(
                                            Text(
                                              "Surprised",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              _feedback["Surprised"].toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(
                                            Text(
                                              "Funny",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              _feedback["Funny"].toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(
                                            Text(
                                              "Unknown",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              _feedback["Unknown"].toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
