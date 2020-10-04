import 'package:flutter/material.dart';

class ProcessingQuestion extends StatefulWidget {
  ProcessingQuestion({Key key}) : super(key: key);

  @override
  _ProcessingQuestionState createState() => _ProcessingQuestionState();
}

class _ProcessingQuestionState extends State<ProcessingQuestion> {
  String _process = "Start";
  String _photo = "";
  int i = 1;

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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                section(i);
                // print(i);
              },
              tooltip: 'Section',
              child: _photo == ""
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(_photo),
                              ),
                            ),
                          ),
                        ),
                        //         Container(
                        //   decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //           image: AssetImage("assets/stressLevel.png"))),
                        // ),
                        // Icon(
                        //   Icons.access_alarm,
                        //   color: Colors.black,
                        //   size: 50,
                        // ),
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
          ),
        ],
      ),
    );
  }
}
