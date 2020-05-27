import 'package:flutter/material.dart';

class ShowLevel extends StatelessWidget {
  const ShowLevel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var score = 8;
    if (score >= 10) {
      return Container(
          child: Positioned(
              left: MediaQuery.of(context).size.width * 0.32,
              top: MediaQuery.of(context).size.height * 0.11,
              width: 150,
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bad1.png"))),
              )));
    } else if (score >= 8) {
      return Container(
          child: Positioned(
              left: MediaQuery.of(context).size.width * 0.32,
              top: MediaQuery.of(context).size.height * 0.11,
              width: 150,
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/stress.png"))),
              )));
    } else if (score >= 5) {
      return Container(
          child: Positioned(
              left: MediaQuery.of(context).size.width * 0.32,
              top: MediaQuery.of(context).size.height * 0.11,
              width: 150,
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/normal.png"))),
              )));
    } else {
      return Container(
          child: Positioned(
              left: MediaQuery.of(context).size.width * 0.32,
              top: MediaQuery.of(context).size.height * 0.11,
              width: 150,
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/happy.png"))),
              )));
    }
  }
}
