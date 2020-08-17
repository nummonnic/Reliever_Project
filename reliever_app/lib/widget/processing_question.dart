import 'package:flutter/material.dart';

class ProcessingQuestion extends StatefulWidget {
  ProcessingQuestion({Key key}) : super(key: key);

  @override
  _ProcessingQuestionState createState() => _ProcessingQuestionState();
}

class _ProcessingQuestionState extends State<ProcessingQuestion> {
  String _process = "Start";
  int i = 1;

  section(state) {
    setState(() {
      if (state == 1) {
        _process = "Q. 1";
        print(MediaQuery.of(context).size.width);
        print(MediaQuery.of(context).size.height);
        //i = 1;
      } else if (state == 2) {
        _process = "Question 2";
        //print(i);
        //i = 2;
      } else if (state == 3) {
        _process = "Question 3";
        //print(i);
        //i = 3;
      } else if (state == 4) {
        _process = "Question 4";
        //print(i);
        //i = 3;
      } else if (state == 5) {
        _process = "Question 5";
        //print(i);
        //i = 3;
      } else if (state == 6) {
        _process = "Finish";
        // i = 0;
      }
      i = i + 1;
    });
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.access_alarm,
                    color: Colors.black,
                    size: 50,
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
          ),
        ],
      ),
    );
  }
}
