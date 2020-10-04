import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          AnimatedContainer(
            decoration: BoxDecoration(
              color: Color(0xff27496d),
              borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
            ),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            duration: Duration(milliseconds: 250),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 3.0),
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
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          bottom: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Stress Level',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: "Circular Air Light",
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height,
                        height: MediaQuery.of(context).size.height - 170,
                        decoration: BoxDecoration(
                          borderRadius: isDrawerOpen
                              ? BorderRadius.circular(40)
                              : BorderRadius.only(
                                  topLeft: Radius.circular(60.0),
                                  topRight: Radius.circular(60.0),
                                ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ListView(
                            children: <Widget>[
                              MoodText(),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 220,
                                          height: 260,
                                          alignment: Alignment.center,
                                          child: PercentHandler(),
                                        ),
                                        Container(
                                          width: 220,
                                          height: 240,
                                          alignment: Alignment.center,
                                          child: StressLevelHandler(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ActivityText(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ChooseClipMain(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Suggested Activities',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff27496d))),
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
