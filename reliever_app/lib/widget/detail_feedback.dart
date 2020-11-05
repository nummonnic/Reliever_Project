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
  final List<String> pic = ['Calm', 'Surprised', 'Funny', 'Sleepy', 'Calm'];
  // Map<String, double> _colors = Map();
  var test = "";
  var listRates = [];
  var listResults = [];
  var datas;
  var elements;
  int _countRate = 0;

  @override
  void initState() {
    _date = new DateTime.now();
    _feedback = {};
    // _colors = {};
    super.initState();
  }

  countRate(List<FeedbackModel> feedbacks) {
    int _count = 0;
    for (int i = 0; i < feedbacks.length; i++) {
      _count++;
    }
    return _count;
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
    Color(0xffebc34d),
    Color(0xffe7e2dd),
    Color(0xff7698a0),
    Color(0xffbeb795),
    Color(0xff3c3c54),
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
              _countRate = countRate(allFeedbacks);
            } else {
              _feedback = {"f": 1, "g": 1, "h": 3};
            }
          } else {
            _feedback = {"f": 2, "g": 1, "h": 4};
          }
          return Container(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: Color(0xffecebeb),
                borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
              ),
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor),
              duration: Duration(milliseconds: 250),
              child: Stack(
                children: <Widget>[
                  Container(
                    //color: Colors.amber,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isDrawerOpen ? 40 : 0.0),
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                      color: Color(0xff27496d),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 10.0, right: 10.0, bottom: 0.0),
                        child: Row(
                          children: [
                            isDrawerOpen
                                ? IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
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
                                      color: Colors.white,
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
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                              top: 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Report Summary',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontFamily: "Circular Air Light",
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 15,
                              left: 15,
                              right: 15,
                            ),
                            child: Container(
                              height: 160,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(
                                  left: 16,
                                  right: 6,
                                ),
                                itemCount: _colors.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 20),
                                    //height: 10,
                                    width: 210,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      color: _colors[index],
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10, left: 20),
                                                    child: Image.asset(
                                                      'assets/images/' +
                                                          pic[index]
                                                              .toString() +
                                                          '.png',
                                                      height: 50,
                                                      width: 50,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0, left: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    index == 1
                                                        ? Text(
                                                            "Nothing",
                                                            style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black38),
                                                          )
                                                        : Text(
                                                            pic[index],
                                                            style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black38),
                                                          ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      _feedback[pic[index]]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 35,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black38),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  _showFeedbackAlert();
                                },
                                child: Container(
                                  height: 50,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Show Feedback",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                              // RaisedButton(
                              //   textColor: Colors.white,
                              //   color: Colors.amber,
                              //   onPressed: () {},
                              //   child: new Text("Show Feedback"),
                              // ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.46,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(isDrawerOpen ? 40 : 0.0),
                                  topLeft: Radius.circular(60),
                                  topRight: Radius.circular(60),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 9,
                                        left: 40,
                                        right: 40,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Feedback Statistic",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              FlatButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _loadChart = true;
                                                    data.addAll(
                                                      {
                                                        'Calm':
                                                            _feedback["Calm"]
                                                                .toDouble(),
                                                        'Happy':
                                                            _feedback["Happy"]
                                                                .toDouble(),
                                                        'Nothing': _feedback[
                                                                "Surprised"]
                                                            .toDouble(),
                                                        'Funny':
                                                            _feedback["Funny"]
                                                                .toDouble(),
                                                        'Unknown':
                                                            _feedback["Unknown"]
                                                                .toDouble(),
                                                      },
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Show Chart",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          // SizedBox(
                                          //   height: 15,
                                          // ),
                                          _loadChart
                                              ? PieChart(
                                                  dataMap: data,
                                                  colorList: _colors,
                                                  animationDuration: Duration(
                                                      milliseconds: 1500),
                                                  chartLegendSpacing: 32.0,
                                                  chartRadius:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2.7,
                                                  showChartValuesInPercentage:
                                                      true,
                                                  showChartValues: true,
                                                  showChartValuesOutside: false,
                                                  chartValueBackgroundColor:
                                                      Colors.grey[200],
                                                  showLegends: true,
                                                  legendPosition:
                                                      LegendPosition.right,
                                                  decimalPlaces: 1,
                                                  showChartValueLabel: true,
                                                  initialAngle: 0,
                                                  chartValueStyle:
                                                      defaultChartValueStyle
                                                          .copyWith(
                                                    color: Colors.blueGrey[900]
                                                        .withOpacity(0.9),
                                                  ),
                                                  chartType: ChartType.disc,
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xffE09543),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    "Feedback History",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    _countRate.toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  _showFeedbackAlert() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Feedback Summary"),
            // Icon(Icons.cancel,)
          ],
        ),
        content: Container(
          height: 320,
          width: 300,
          // ListView.builder(
          //   scrollDirection: Axis.vertical,
          //   itemCount: pic.length,
          //   itemBuilder: (context, index) {
          //     return DataTable(
          //       columns: <DataColumn>[
          //         DataColumn(
          //           label: Text(
          //             "Feedback",
          //             style: TextStyle(
          //               fontSize: 20,
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //         DataColumn(
          //           label: Text(
          //             "Number",
          //             style: TextStyle(
          //               fontSize: 20,
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //       ],
          //       rows: <DataRow>[
          //         DataRow(
          //           cells: <DataCell>[
          //             DataCell(
          //               Text(
          //                 pic[index],
          //                 style: TextStyle(
          //                   fontSize: 15,
          //                   color: Colors.black,
          //                 ),
          //               ),
          //             ),
          //             DataCell(
          //               Text(
          //                 _feedback[pic[index]].toString(),
          //                 style: TextStyle(
          //                   fontSize: 15,
          //                   color: Colors.black,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     );
          //   },
          // ),

          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                                "Nothing",
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
