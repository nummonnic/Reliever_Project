import 'package:flutter/material.dart';
import 'package:relieverapp/database/feedback_firestore_service.dart';
import 'package:relieverapp/model/feedback.dart';

import './chooseClipMain.dart';
import '../../widget/percent.dart';
import '../../database/stress_level_handler.dart';

class DescriptionResult extends StatefulWidget {
  DescriptionResult({Key key}) : super(key: key);

  @override
  _DescriptionResultState createState() => _DescriptionResultState();
}

class _DescriptionResultState extends State<DescriptionResult> {
  double xOffset = 0; //set X axis and Y axis
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  final List<String> pic = ['Calm', 'Surprised', 'Funny', 'Sleepy'];
  final _key = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String _rate = "";
  DateTime _date;

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPage = 2;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPage; i++) {
      list.add(
        i == _currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(
        microseconds: 150,
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _date = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: Color(0xff1a3c5a),
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 0.0,
                  top: 23.0,
                ),
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
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  bottom: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Stress Level',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontFamily: "Circular Air Light",
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.637,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: isDrawerOpen
                          ? BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                              bottomLeft: Radius.circular(40),
                            )
                          : BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        ActivityText(),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ChooseClipMain(),
                        ),
                        SizedBox(
                          height: 0,
                        ),

                        // RaisedButton(
                        //   padding: const EdgeInsets.all(0.0),
                        //   textColor: Colors.white,
                        //   color: Colors.brown,
                        //   onPressed: () {
                        //     _showRatingVideo();
                        //   },
                        //   // child: new Text("Rate Video"),
                        //   child: Container(

                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 5.6,
              ),
              Center(
                child: Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width / 1.08,
                  decoration: BoxDecoration(
                    color: Color(0xffe1dacb),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 220,
                            height: 200,
                            alignment: Alignment.center,
                            child: PercentHandler(),
                          ),
                          Container(
                            width: 220,
                            height: 200,
                            alignment: Alignment.center,
                            child: StressLevelHandler(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.95,
              ),
              RaisedButton(
                padding: const EdgeInsets.all(0.0),
                // textColor: Colors.white,
                // color: Colors.brown,
                color: Colors.white,
                onPressed: () {
                  _showRatingVideo();
                },
                // child: new Text("Rate Video"),
                child: Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Color(0xffc2452c),
                      borderRadius: BorderRadius.circular(10)
                      // shape: BoxShape.circle,
                      ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("Rate Video",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // return Container(
    //   child: Stack(
    //     children: <Widget>[
    //       AnimatedContainer(
    //         decoration: BoxDecoration(
    //           color: Color(0xff27496d),
    //           borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
    //         ),
    //         transform: Matrix4.translationValues(xOffset, yOffset, 0)
    //           ..scale(scaleFactor),
    //         duration: Duration(milliseconds: 250),
    //         child: ListView(
    //           children: <Widget>[
    //             Padding(
    //               padding: const EdgeInsets.only(
    //                   left: 10.0, right: 10.0, bottom: 3.0),
    //               child: Row(
    //                 children: [
    //                   isDrawerOpen
    //                       ? IconButton(
    //                           icon: Icon(
    //                             Icons.arrow_back_ios,
    //                             color: Colors.white,
    //                           ),
    //                           onPressed: () {
    //                             setState(
    //                               () {
    //                                 xOffset = 0;
    //                                 yOffset = 0;
    //                                 scaleFactor = 1;
    //                                 isDrawerOpen = false;
    //                               },
    //                             );
    //                           },
    //                         )
    //                       : IconButton(
    //                           icon: Icon(
    //                             Icons.menu,
    //                             color: Colors.white,
    //                           ),
    //                           onPressed: () {
    //                             setState(
    //                               () {
    //                                 xOffset = 230;
    //                                 yOffset = 150;
    //                                 scaleFactor = 0.6;
    //                                 isDrawerOpen = true;
    //                               },
    //                             );
    //                           },
    //                         ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(0.0),
    //               child: Column(
    //                 children: <Widget>[
    //                   Padding(
    //                     padding: const EdgeInsets.only(
    //                       left: 20,
    //                       bottom: 20,
    //                     ),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: <Widget>[
    //                         Text(
    //                           'Stress Level',
    //                           style: TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 40.0,
    //                             fontFamily: "Circular Air Light",
    //                             letterSpacing: 1.0,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.all(20.0),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: <Widget>[
    //                         Container(
    //                           width: MediaQuery.of(context).size.height,
    //                           height: MediaQuery.of(context).size.height * 0.7,
    //                           decoration: BoxDecoration(
    //                             borderRadius: isDrawerOpen
    //                                 ? BorderRadius.circular(40)
    //                                 : BorderRadius.only(
    //                                     topLeft: Radius.circular(20.0),
    //                                     topRight: Radius.circular(20.0),
    //                                     bottomLeft: Radius.circular(20.0),
    //                                     bottomRight: Radius.circular(20.0),
    //                                   ),
    //                             color: Colors.white,
    //                           ),
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(20.0),
    //                             child:
    //                                 // Column(
    //                                 //   children: <Widget>[
    //                                 PageView(
    //                               physics: ClampingScrollPhysics(),
    //                               controller: _pageController,
    //                               onPageChanged: (int page) {
    //                                 setState(() {
    //                                   _currentPage = page;
    //                                 });
    //                               },
    //                               children: <Widget>[
    //                                 Column(
    //                                   //crossAxisAlignment: CrossAxisAlignment.center,
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.center,
    //                                   children: <Widget>[
    //                                     MoodText(),
    //                                     SizedBox(
    //                                       height: 20,
    //                                     ),
    //                                     Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.center,
    //                                       children: <Widget>[
    //                                         Stack(
    //                                           children: <Widget>[
    //                                             Container(
    //                                               width: 220,
    //                                               height: 260,
    //                                               alignment: Alignment.center,
    //                                               child: PercentHandler(),
    //                                             ),
    //                                             Container(
    //                                               width: 220,
    //                                               height: 240,
    //                                               alignment: Alignment.center,
    //                                               child: StressLevelHandler(),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 Column(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.center,
    //                                   children: <Widget>[
    //                                     ActivityText(),
    //                                     SizedBox(
    //                                       height: 30,
    //                                     ),
    //                                     Padding(
    //                                       padding: const EdgeInsets.all(10.0),
    //                                       child: ChooseClipMain(),
    //                                     ),
    //                                     SizedBox(
    //                                       height: 50,
    //                                     ),
    //                                     RaisedButton(
    //                                       padding: const EdgeInsets.all(8.0),
    //                                       textColor: Colors.white,
    //                                       color: Colors.brown,
    //                                       onPressed: () {
    //                                         print("object");

    //                                         _showRatingVideo();
    //                                       },
    //                                       child: new Text("Rate Video"),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 30,
    //                         ),
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: _buildPageIndicator(),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  _showRatingVideo() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Rate Video"),
        content: Container(
          key: _key,
          height: 130,
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pic.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              print(pic[index]);
                              _rate = pic[index];
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/' +
                                        pic[index].toString() +
                                        '.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(pic[index].toString())
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () async {
                  setState(() {
                    if (_rate == "") {
                      _rate = "unknown";
                    }
                  });
                  print("check: " + _rate);

                  await rateDBS.createItem(
                    FeedbackModel(
                      rate: _rate,
                      rateDate: _date,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  "Save Feedback",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoodText extends StatelessWidget {
  const MoodText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Your Current Mood',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color(0xff27496d),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityText extends StatelessWidget {
  const ActivityText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Suggested Activities',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Color(0xff27496d),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PercentText extends StatelessWidget {
  const PercentText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Percent of Stress',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff27496d))),
          ],
        ),
      ),
    );
  }
}
