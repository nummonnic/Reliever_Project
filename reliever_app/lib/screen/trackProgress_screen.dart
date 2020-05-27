import 'package:flutter/material.dart';
//import 'package:relieverapp/screen/homepage_screen.dart';
import 'drawerScreen.dart';
import '../widget/detail_chart.dart';

//import '../template/background.dart';

class TrackProgress extends StatelessWidget {
  static const routeName = '/progress-screen';
  const TrackProgress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        DrawerScreen(),
        detailProgress(),
      ],
    ));
  }
}
