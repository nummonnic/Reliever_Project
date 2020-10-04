import 'package:flutter/material.dart';
import 'dart:math';

import '../widget/processing_question.dart';

class Processing extends StatefulWidget {
  Processing({Key key}) : super(key: key);

  @override
  _ProcessingState createState() => _ProcessingState();
}

class _ProcessingState extends State<Processing>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;
  final double initialRadius = 30;
  double radius = 0.0;

  double xOffset = 0; //set X axis and Y axis
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation_rotation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));

    animation_radius_in = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animation_radius_out = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));
    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animation_radius_in.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    var random = new Random();

    return AnimatedContainer(
      decoration: BoxDecoration(
        color: Color(0xff27496d),
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Column(
        children: <Widget>[
          // SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
            child: Row(
              children: [
                isDrawerOpen
                    ? IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            },
                          );
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            },
                          );
                        },
                      )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Measure Stress Level',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: "Circular Air Light",
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          Container(
            width: 400.0,
            height: 220.0,
            child: Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: RotationTransition(
                      turns: animation_rotation,
                      child: Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(pi / 4),
                                (radius * 5) * sin(pi / 4)),
                            child: Dot(
                              radius: 20.0,
                              color: Color(0xffbb3b0e),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(1.5 * pi / 4),
                                (radius * 5) * sin(1.5 * pi / 4)),
                            child: Dot(
                              radius: 30.0,
                              color: Color(0xffdd7631),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(2 * pi / 4),
                                (radius * 5) * sin(2 * pi / 4)),
                            child: Dot(
                              radius: 10.0,
                              color: Color(0xff708160),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(2.5 * pi / 4),
                                (radius * 5) * sin(2.5 * pi / 4)),
                            child: Dot(
                              radius: 40.0,
                              color: Color(0xffd8c593),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(3 * pi / 4),
                                (radius * 5) * sin(3 * pi / 4)),
                            child: Dot(
                              radius: 15.0,
                              color: Color(0xffdd7631),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(3.5 * pi / 4),
                                (radius * 5) * sin(3.5 * pi / 4)),
                            child: Dot(
                              radius: 35.0,
                              color: Color(0xffbb3b0e),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(4 * pi / 4),
                                (radius * 5) * sin(4 * pi / 4)),
                            child: Dot(
                              radius: 20.0,
                              color: Color(0xff708160),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(4.5 * pi / 4),
                                (radius * 5) * sin(4.5 * pi / 4)),
                            child: Dot(
                              radius: 50.0,
                              color: Color(0xffdd7631),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(5 * pi / 4),
                                (radius * 5) * sin(5 * pi / 4)),
                            child: Dot(
                              radius: 10.0,
                              color: Color(0xffd8c593),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(5.5 * pi / 4),
                                (radius * 5) * sin(5.5 * pi / 4)),
                            child: Dot(
                              radius: 30.0,
                              color: Color(0xffbb3b0e),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(6 * pi / 4),
                                (radius * 5) * sin(6 * pi / 4)),
                            child: Dot(
                              radius: 15.0,
                              color: Color(0xffd8c593),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(6.5 * pi / 4),
                                (radius * 5) * sin(6.5 * pi / 4)),
                            child: Dot(
                              radius: 50.0,
                              color: Color(0xff708160),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(7 * pi / 4),
                                (radius * 5) * sin(7 * pi / 4)),
                            child: Dot(
                              radius: 30.0,
                              color: Color(0xffbb3b0e),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(7.5 * pi / 4),
                                (radius * 5) * sin(7.5 * pi / 4)),
                            child: Dot(
                              radius: 10.0,
                              color: Color(0xffdd7631),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(8 * pi / 4),
                                (radius * 5) * sin(8 * pi / 4)),
                            child: Dot(
                              radius: 40.0,
                              color: Color(0xffd8c593),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset((radius * 5) * cos(8.5 * pi / 4),
                                (radius * 5) * sin(8.5 * pi / 4)),
                            child: Dot(
                              radius: 30.0,
                              color: Color(0xff708160),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: ProcessingQuestion(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
