import 'package:flutter/material.dart';

import '../widget/detail_feedback.dart';
import 'drawerScreen.dart';

class ProgressScreen extends StatelessWidget {
  static const routeName = '/add_progress-page';
  const ProgressScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DrawerScreen(),
          DetailFeedback(),
        ],
      ),
    );
    // return MaterialApp(
    //   home: DetailFeedback(),
    // );
  }
}
