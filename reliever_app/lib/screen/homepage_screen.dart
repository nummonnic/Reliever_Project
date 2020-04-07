import 'package:flutter/material.dart';

import '../template/background.dart';
import '../router/diary-route.dart';
import '../router/result-route.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(children: <Widget>[
      Container(
        child: Stack(
          children: <Widget>[
            BackGround(),
            info(),
            diary_item(),
            result_item(),
          ],
        ),
      ),
    ]));
  }
}

class info extends StatelessWidget {
  const info({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Positioned(
            left: 130,
            top: 80,
            width: 150,
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Asset7.png"))),
            )));
  }
}
