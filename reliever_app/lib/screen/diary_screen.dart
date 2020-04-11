import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widget/side_manu.dart';
import '../template/background.dart';
import '../widget/calenda_item.dart';

class DiaryScreen extends StatelessWidget {
  static const routeName = '/diary-screen';
  @override
  Widget build(BuildContext context) {
    //final routeArgs = ModalRoute.of(context).settings
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The diary',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown[500],
      ),
      drawer: SideManu(),
      body: Stack(children: <Widget>[
        BackGround(),
        Container(
          padding: EdgeInsets.all(50.0),
          alignment: Alignment.center,
          child: calenda(),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.brown[200]),
        )
      ]),
    );
  }
}
