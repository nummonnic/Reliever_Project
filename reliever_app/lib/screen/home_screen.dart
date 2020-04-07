import 'package:flutter/material.dart';
// import 'package:relieverapp/login.dart';
//import 'package:relieverapp/screen/login_screen.dart';
import 'package:relieverapp/widget/homeBG.dart';
import 'package:relieverapp/widget/resultB.dart';
import 'package:relieverapp/widget/diaryB.dart';
import 'package:relieverapp/widget/side_manu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.orangeAccent[100], elevation: 0.0),
        drawer: SideManu(),
        body: ListView(children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.orangeAccent[100],
                  // alignment: Alignment.center,
                  width: 420,
                  height: 605,
                  child: CustomPaint(
                    painter: HomeBack(),
                  ),
                ),
                Container(
                    child: Positioned(
                        left: 130,
                        top: 80,
                        width: 150,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/Asset7.png"))),
                        ))),
                Container(
                  child: new GoToResult(),
                ),
                Container(
                  child: new GoToDiary(),
                ),
              ],
            ),
          ),
        ]));
  }
}

