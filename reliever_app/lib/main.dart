import 'package:flutter/material.dart';

import './screen/diary_screen.dart';
import './screen/result_screen.dart';
import './screen/add_event_screen.dart';
import './screen/trackProgress_screen.dart';
import './template/homeScreen.dart';
import './screen/test.dart';
//import './screen/homepage_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reliever',
      routes: {
        '/': (ctx) => ResultScreen(),
        DiaryScreen.routeName: (ctx) => DiaryScreen(),
        ResultScreen.route: (ctx) => ResultScreen(),
        AddEventScreen.routeName: (ctx) => AddEventScreen(),
        //AddEventPage.routeName: (ctx) => AddEventPage(),
        TrackProgress.routeName: (ctx) => TrackProgress(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SampleTest.routeName: (ctx) => SampleTest(), 
      },
    );
  }
}
