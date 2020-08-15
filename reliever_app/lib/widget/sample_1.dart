import 'package:flutter/material.dart';

class Sample_1 extends StatefulWidget {
  Sample_1({Key key}) : super(key: key);

  @override
  _Sample_1State createState() => _Sample_1State();
}

class _Sample_1State extends State<Sample_1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/bad1.png"))),
                  ),
                ),
                SizedBox(height: 20),
                Text("Start"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
