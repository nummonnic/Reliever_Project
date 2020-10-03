import 'package:flutter/material.dart';

import './screen/diary_screen.dart';
import './screen/result_screen.dart';
import './screen/add_event_screen.dart';
import './screen/trackProgress_screen.dart';
import './template/homeScreen.dart';
import './screen/loading_question.dart';
import './screen/add_voice_screen.dart';
import './screen/result_voice.dart';
import './widget/voice_descript.dart';
import './screen/feedback_progress.dart';

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
        LoadingProcess.routeName: (ctx) => LoadingProcess(), 
        AddVoiceScreen.routeName: (ctx) => AddVoiceScreen(),
        ShowDiaryVoice.routeName: (ctx) => ShowDiaryVoice(),
        DetailVoice.routeName: (ctx) => DetailVoice(),
        ProgressScreen.routeName: (ctx) => ProgressScreen(),
      },
    );
  }
}
