import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xffa4c5c6),
                  ),
                ),
                Expanded(
                  child: Container(color: Colors.white10),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
