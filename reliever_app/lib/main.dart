import 'package:flutter/material.dart';

import './screen/diary_screen.dart';
import './screen/result_screen.dart';
import './screen/add_event_screen.dart';

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
        ResultScreen.routeName: (ctx) => ResultScreen(),
        AddEventPage.routeName: (ctx) => AddEventPage(),
      },
    );
  }
}
