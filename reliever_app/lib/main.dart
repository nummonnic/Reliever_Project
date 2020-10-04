import 'package:flutter/material.dart';

import './screen/diary/diary_screen.dart';
import './screen/main/result_screen.dart';
import './screen/diary/add_event_screen.dart';
// import './screen/trackProgress_screen.dart';
// import './template/homeScreen.dart';
import './screen/loading/loading_question.dart';
import './screen/diary/add_voice_screen.dart';
import './screen/diary/result_voice.dart';
import './widget/main/voice_descript.dart';
import './screen/chart/feedback_progress.dart';
import './widget/main/showYoutube.dart';
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
        // TrackProgress.routeName: (ctx) => TrackProgress(),
        // HomeScreen.routeName: (ctx) => HomeScreen(),
        LoadingProcess.routeName: (ctx) => LoadingProcess(), 
        AddVoiceScreen.routeName: (ctx) => AddVoiceScreen(),
        ShowDiaryVoice.routeName: (ctx) => ShowDiaryVoice(),
        DetailVoice.routeName: (ctx) => DetailVoice(),
        ProgressScreen.routeName: (ctx) => ProgressScreen(),
        YoutubeVideo.routeName: (ctx) => YoutubeVideo(),
      },
    );
  }
}
