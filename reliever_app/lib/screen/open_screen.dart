import 'package:flutter/material.dart';
import 'package:relieverapp/widget/openBG.dart';
import 'package:relieverapp/widget/gotologinB.dart';
class OpenScreen extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return new MaterialApp(
        home: OpenPage()
      ); 
    }
  }

class OpenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //       backgroundColor: Colors.orangeAccent[100], elevation: 0.0),
        body: ListView(children: <Widget>[
      Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.orangeAccent[100],
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: OpenBack(),
                child: Align(
                    alignment: Alignment(0.0, 0.1),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '  JUST BECAUSE YOU\n',
                            style: TextStyle(
                                color: Colors.indigo[700],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                          TextSpan(
                            text: '   HAVE A BAD DAY\n',
                            style: TextStyle(
                                color: Colors.indigo[700],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                          TextSpan(
                            text: '  DOESN\'T MEAN YOU\n',
                            style: TextStyle(
                                color: Colors.indigo[700],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                          TextSpan(
                              text: '   HAVE A BAD LIFE',
                              style: TextStyle(
                                  color: Colors.indigo[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none))
                        ],
                      ),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
              child: Text('Welcome',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: Colors.indigo[700])),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 100, 0, 0),
              child: Text('to Reliever',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: Colors.indigo[700])),
            ),
            Container(
                child: Positioned(
                    left: 300,
                    top: 30,
                    width: 80,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/LG5.png"))),
                    )
                )
            ),
            Container(
              child: GoToLogB()
            )
          ],
        ),
      ),
    ]));
  }
}


