import 'package:flutter/material.dart';

import '../widget/side_manu.dart';
import '../widget/homeBG.dart';
import '../widget/showMood.dart';
import '../widget/chooseClip.dart';
import '../database/stress_level_handler.dart';
//import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
//import '../widget/showVideo.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('The Result'),
            backgroundColor: Colors.brown,
            elevation: 0.0),
        drawer: SideManu(),
        body: ListView(children: <Widget>[
          Container(
              child: Stack(children: <Widget>[
            Background(),
            MoodText(),
            ShowLevel(),
            ActivityText(),
            ActivityClip(),
            StressLevelHandler(),
          ])),
        ]));
  }
}

class MoodText extends StatelessWidget {
  const MoodText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment(0, -0.93),
          child: Text('Your Current Mood',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.brown)),
        ));
  }
}

class ActivityText extends StatelessWidget {
  const ActivityText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment(0, -0.2),
          child: Text('Suggested Activities',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.brown)),
        ));
  }
}
