import 'package:flutter/material.dart';

import '../drawerScreen.dart';
import '../../widget/main/detail_Result.dart';

class ResultScreen extends StatelessWidget {
  static const route = '/result-screen';
  const ResultScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        DrawerScreen(),
        DescriptionResult(),
      ]),
    );
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
          alignment: Alignment(0, -0.3),
          child: Text('Suggested Activities',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.brown)),
        ));
  }
}
