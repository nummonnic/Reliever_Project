import 'package:flutter/material.dart';
//import 'package:table_calendar/table_calendar.dart';

import '../drawerScreen.dart';
import '../../widget/detail_Diary.dart';

class DiaryScreen extends StatelessWidget {
  static const routeName = '/diary-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DrawerScreen(),
          DiaryDetail(),
        ],
      ),
    );
  }
}
