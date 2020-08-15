import 'package:flutter/material.dart';

import '../screen/result_screen.dart';
import '../screen/diary_screen.dart';
import '../screen/trackProgress_screen.dart';
import '../screen/test.dart';

List<Map> drawerItems = [
  {
    'icon': Icons.portrait,
    'title': 'Stress Level',
    'route': ResultScreen.route,
    'selectState': 1
  },
  {
    'icon': Icons.calendar_today,
    'title': 'Diary',
    'route': DiaryScreen.routeName,
    'selectState': 2
  },
  {
    'icon': Icons.attachment,
    'title': 'Progress',
    'route': TrackProgress.routeName,
    'selectState': 3
  },
  {
    'icon': Icons.add_shopping_cart,
    'title': 'Sample Test',
    'route': SampleTest.routeName,
    'selectState': 4
  },
];
