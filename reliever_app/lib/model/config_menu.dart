import 'package:flutter/material.dart';

import '../screen/result_screen.dart';
import '../screen/diary_screen.dart';
import '../screen/trackProgress_screen.dart';
import '../screen/loading_question.dart';
import '../screen/feedback_progress.dart';

List<Map> drawerItems = [
  {
    'icon': Icons.portrait,
    'title': 'Result',
    'route': ResultScreen.route,
    'selectState': 1
  },
  {
    'icon': Icons.calendar_today,
    'title': 'Diary',
    'route': DiaryScreen.routeName,
    'selectState': 2
  },
  // {
  //   'icon': Icons.attachment,
  //   'title': 'Progress',
  //   'route': TrackProgress.routeName,
  //   'selectState': 3
  // },
  {
    'icon': Icons.cached,
    'title': 'Measure ',
    'route': LoadingProcess.routeName,
    'selectState': 4
  },
  {
    'icon': Icons.favorite,
    'title': 'Feedback',
    'route': ProgressScreen.routeName,
    'selectState': 5
  },
];
