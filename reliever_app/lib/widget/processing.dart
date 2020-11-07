import 'package:flutter/material.dart';
import 'dart:math';

import '../widget/processing_question.dart';
import 'package:flutter/services.dart';
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
  String _process = "Start";
  String _photo = "";
  int i = 1;

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

  section(state) {
    setState(
      () {
        if (state == 1) {
          _process = "Q. 1";
          _photo = "assets/Sleep.png";
          // print(MediaQuery.of(context).size.width);
          // print(MediaQuery.of(context).size.height);
        } else if (state == 2) {
          _process = "Q. 2";
          _photo = "assets/Emotional.png";
        } else if (state == 3) {
          _process = "Q. 3";
          _photo = "assets/Eat.png";
        } else if (state == 4) {
          _process = "Q. 4";
          _photo = "assets/Work.png";
        } else if (state == 5) {
          _process = "Q. 5";
          _photo = "assets/Society.png";
        } else if (state == 6) {
          _process = "Finish";
          _photo = "";
        }
        i = i + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitDown,
//    DeviceOrientation.portraitUp,
//    DeviceOrientation.landscapeRight,
//     DeviceOrientation.landscapeLeft,
// ]);
    var random = new Random();
    var height = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      decoration: BoxDecoration(
        //color: Color(0xfff1a3c5a),
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Color(0xffecb45b),
                  // borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
                  borderRadius: isDrawerOpen
                      ? BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          // bottomLeft: Radius.circular(40.0),
                        )
                      : BorderRadius.circular(0),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Color(0xff1a3c5a),
                  borderRadius: isDrawerOpen
                      ? BorderRadius.only(
                          // topLeft: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                        )
                      : BorderRadius.circular(0),
                ),
              ),
            ],
          ),
          ListView(
  children: <Widget>[
          Column(
            children: <Widget>[
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
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 20,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: 430,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: <Widget>[
                      // Container(
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
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
                                          offset: Offset(
                                              (radius * 5) * cos(pi / 4),
                                              (radius * 5) * sin(pi / 4)),
                                          child: Dot(
                                            radius: 20.0,
                                            color: Color(0xffbb3b0e),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(1.5 * pi / 4),
                                              (radius * 5) * sin(1.5 * pi / 4)),
                                          child: Dot(
                                            radius: 30.0,
                                            color: Color(0xffdd7631),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(2 * pi / 4),
                                              (radius * 5) * sin(2 * pi / 4)),
                                          child: Dot(
                                            radius: 10.0,
                                            color: Color(0xff708160),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(2.5 * pi / 4),
                                              (radius * 5) * sin(2.5 * pi / 4)),
                                          child: Dot(
                                            radius: 40.0,
                                            color: Color(0xffd8c593),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(3 * pi / 4),
                                              (radius * 5) * sin(3 * pi / 4)),
                                          child: Dot(
                                            radius: 15.0,
                                            color: Color(0xffdd7631),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(3.5 * pi / 4),
                                              (radius * 5) * sin(3.5 * pi / 4)),
                                          child: Dot(
                                            radius: 35.0,
                                            color: Color(0xffbb3b0e),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(4 * pi / 4),
                                              (radius * 5) * sin(4 * pi / 4)),
                                          child: Dot(
                                            radius: 20.0,
                                            color: Color(0xff708160),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(4.5 * pi / 4),
                                              (radius * 5) * sin(4.5 * pi / 4)),
                                          child: Dot(
                                            radius: 50.0,
                                            color: Color(0xffdd7631),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(5 * pi / 4),
                                              (radius * 5) * sin(5 * pi / 4)),
                                          child: Dot(
                                            radius: 10.0,
                                            color: Color(0xffd8c593),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(5.5 * pi / 4),
                                              (radius * 5) * sin(5.5 * pi / 4)),
                                          child: Dot(
                                            radius: 30.0,
                                            color: Color(0xffbb3b0e),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(6 * pi / 4),
                                              (radius * 5) * sin(6 * pi / 4)),
                                          child: Dot(
                                            radius: 15.0,
                                            color: Color(0xffd8c593),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(6.5 * pi / 4),
                                              (radius * 5) * sin(6.5 * pi / 4)),
                                          child: Dot(
                                            radius: 50.0,
                                            color: Color(0xff708160),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(7 * pi / 4),
                                              (radius * 5) * sin(7 * pi / 4)),
                                          child: Dot(
                                            radius: 30.0,
                                            color: Color(0xffbb3b0e),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(7.5 * pi / 4),
                                              (radius * 5) * sin(7.5 * pi / 4)),
                                          child: Dot(
                                            radius: 10.0,
                                            color: Color(0xffdd7631),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(8 * pi / 4),
                                              (radius * 5) * sin(8 * pi / 4)),
                                          child: Dot(
                                            radius: 40.0,
                                            color: Color(0xffd8c593),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              (radius * 5) * cos(8.5 * pi / 4),
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
                                  // color: Colors.white,
                                  child: Center(
                                    // child: ProcessingQuestion(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffe1dacb),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 200,
                                            height: 200,
                                            child: _photo == ""
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        _process,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 30,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                : Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 80,
                                                        width: 80,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: AssetImage(
                                                                  _photo),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 25),
                                                      Text(
                                                        '$_process',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 30,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //  ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              // SizedBox(
              //   height: height * 0.75,
              // ),
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  child: FlatButton(
                    onPressed: () {
                      print("object");
                      section(i);
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffc2452c),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
  ]),
        ],
      ),
    );

    // return AnimatedContainer(
    //   decoration: BoxDecoration(
    //     color: Color(0xff27496d),
    //     borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
    //   ),
    //   transform: Matrix4.translationValues(xOffset, yOffset, 0)
    //     ..scale(scaleFactor),
    //   duration: Duration(milliseconds: 250),
    //   child: Column(
    //     children: <Widget>[
    //       // SizedBox(height: 40),
    //       Padding(
    //         padding: const EdgeInsets.only(
    //             left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
    //         child: Row(
    //           children: [
    //             isDrawerOpen
    //                 ? IconButton(
    //                     icon: Icon(
    //                       Icons.arrow_back_ios,
    //                       color: Colors.white,
    //                     ),
    //                     onPressed: () {
    //                       setState(
    //                         () {
    //                           xOffset = 0;
    //                           yOffset = 0;
    //                           scaleFactor = 1;
    //                           isDrawerOpen = false;
    //                         },
    //                       );
    //                     },
    //                   )
    //                 : IconButton(
    //                     icon: Icon(
    //                       Icons.menu,
    //                       color: Colors.white,
    //                     ),
    //                     onPressed: () {
    //                       setState(
    //                         () {
    //                           xOffset = 230;
    //                           yOffset = 150;
    //                           scaleFactor = 0.6;
    //                           isDrawerOpen = true;
    //                         },
    //                       );
    //                     },
    //                   )
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 30.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               'Measure Stress Level',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 25.0,
    //                 fontFamily: "Circular Air Light",
    //                 letterSpacing: 1.0,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(height: MediaQuery.of(context).size.height / 12),
    //       SizedBox(height: MediaQuery.of(context).size.height / 12),
    //       // Container(
    //       //   width: 400.0,
    //       //   height: 220.0,
    //       //   child: Center(
    //       //     child: Stack(
    //       //       children: <Widget>[
    //       //         Container(
    //       //           child: RotationTransition(
    //       //             turns: animation_rotation,
    //       //             child: Stack(
    //       //               children: <Widget>[
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(pi / 4),
    //       //                       (radius * 5) * sin(pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 20.0,
    //       //                     color: Color(0xffbb3b0e),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(1.5 * pi / 4),
    //       //                       (radius * 5) * sin(1.5 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 30.0,
    //       //                     color: Color(0xffdd7631),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(2 * pi / 4),
    //       //                       (radius * 5) * sin(2 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 10.0,
    //       //                     color: Color(0xff708160),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(2.5 * pi / 4),
    //       //                       (radius * 5) * sin(2.5 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 40.0,
    //       //                     color: Color(0xffd8c593),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(3 * pi / 4),
    //       //                       (radius * 5) * sin(3 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 15.0,
    //       //                     color: Color(0xffdd7631),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(3.5 * pi / 4),
    //       //                       (radius * 5) * sin(3.5 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 35.0,
    //       //                     color: Color(0xffbb3b0e),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(4 * pi / 4),
    //       //                       (radius * 5) * sin(4 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 20.0,
    //       //                     color: Color(0xff708160),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(4.5 * pi / 4),
    //       //                       (radius * 5) * sin(4.5 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 50.0,
    //       //                     color: Color(0xffdd7631),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(5 * pi / 4),
    //       //                       (radius * 5) * sin(5 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 10.0,
    //       //                     color: Color(0xffd8c593),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(5.5 * pi / 4),
    //       //                       (radius * 5) * sin(5.5 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 30.0,
    //       //                     color: Color(0xffbb3b0e),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(6 * pi / 4),
    //       //                       (radius * 5) * sin(6 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 15.0,
    //       //                     color: Color(0xffd8c593),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(6.5 * pi / 4),
    //       //                       (radius * 5) * sin(6.5 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 50.0,
    //       //                     color: Color(0xff708160),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(7 * pi / 4),
    //       //                       (radius * 5) * sin(7 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 30.0,
    //       //                     color: Color(0xffbb3b0e),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(7.5 * pi / 4),
    //       //                       (radius * 5) * sin(7.5 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 10.0,
    //       //                     color: Color(0xffdd7631),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(8 * pi / 4),
    //       //                       (radius * 5) * sin(8 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 40.0,
    //       //                     color: Color(0xffd8c593),
    //       //                   ),
    //       //                 ),
    //       //                 Transform.translate(
    //       //                   offset: Offset((radius * 5) * cos(8.5 * pi / 4),
    //       //                       (radius * 5) * sin(8.5 * pi / 4)),
    //       //                   child: Dot(
    //       //                     radius: 30.0,
    //       //                     color: Color(0xff708160),
    //       //                   ),
    //       //                 ),
    //       //               ],
    //       //             ),
    //       //           ),
    //       //         ),
    //       //         Container(
    //       //           child: Center(
    //       //             child: ProcessingQuestion(),
    //       //           ),
    //       //         ),
    //       //       ],
    //       //     ),
    //       //   ),
    //       // ),
    //     ],
    //   ),
    // );
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
