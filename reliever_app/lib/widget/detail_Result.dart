import 'package:flutter/material.dart';

import 'showMood.dart';
import '../widget/chooseClip.dart';
import '../widget/percent.dart';
import '../database/stress_level_handler.dart';

class DescriptionResult extends StatefulWidget {
  //static const routeName = '/desResult-screen';
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
    return 
        AnimatedContainer(
      decoration: BoxDecoration(
        color: Color(0xff27496d),
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          //Padding(
          //  padding: const EdgeInsets.only(
          //      left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
          //child:
          Row(
            children: [
              isDrawerOpen
                  ? IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                        });
                      })
                  : IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          xOffset = 230;
                          yOffset = 150;
                          scaleFactor = 0.6;
                          isDrawerOpen = true;
                        });
                      },
                    )
            ],
          ),
          //),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
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
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              //child: Padding(
              //padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: ListView(
                children: <Widget>[
                  //       Container(
                  // child: Stack(children: <Widget>[
                  MoodText(),
                  StressLevelHandler(),
                  PercentText(),
                  PercentHandler(),
                  ActivityText(),
                  ActivityClip(),
                  Row(
                    children: <Widget>[
                      SizedBox(height: 10),
                    ],
                  )
                  //ShowLevel(),
                  // ]))
                ],
              ),
              //),
            ),
          ),
        ],
      ),
    );
    //);
  }
}

class MoodText extends StatelessWidget {
  const MoodText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Your Current Mood',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff27496d)),
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
            //height: MediaQuery.of(context).size.height,
            //width: MediaQuery.of(context).size.height,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Suggested Activities',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff27496d))),
          ],
        )));
  }
}

class PercentText extends StatelessWidget {
  const PercentText({Key key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return 
    Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child:Container(
      child: Positioned(
              left: MediaQuery.of(context).size.width * 0.17,
              top: MediaQuery.of(context).size.height * 0.34,
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.height,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('Percentage of Stress',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xff27496d))),
      ],
    ))));
  }
}
