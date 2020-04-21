import 'package:flutter/material.dart';
import 'package:relieverapp/widget/openBG.dart';
import 'package:relieverapp/widget/gotologinB.dart';

class OpenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: OpenPage());
  }
}

class OpenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // appBar: new AppBar(
        //       backgroundColor: Colors.orangeAccent[100], elevation: 0.0),
        body: ListView(
          children: <Widget>[
      Container(
        child: Stack(
          children: <Widget>[
            OpenBack(),
            Openinfo(),
            Opentext(),
            Openpic(),
            GoToLogB(),
          ],
        ),
      ),
    ]));
  }
}

class Openinfo extends StatelessWidget {
  const Openinfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
      //width: MediaQuery.of(context).size.width*0.65,
      top: MediaQuery.of(context).size.height*0.07,
      left: MediaQuery.of(context).size.width*0.01,
        child:Column(children: <Widget>[
      Container(
        //padding: EdgeInsets.fromLTRB(5, 50, 0, 0),
        child: Text('Welcome',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                color: Colors.indigo[700])),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
        child: Text('to Reliever',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                color: Colors.indigo[700])),
      
      ),
        
    ])
    )
    );
  }
}

class Opentext extends StatelessWidget {
  const Opentext({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height,
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
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none),
                          ),
                          TextSpan(
                            text: '      HAVE A BAD DAY\n',
                            style: TextStyle(
                                color: Colors.indigo[700],
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none),
                          ),
                          TextSpan(
                            text: '  DOESN\'T MEAN YOU\n',
                            style: TextStyle(
                                color: Colors.indigo[700],
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none),
                          ),
                          TextSpan(
                              text: '      HAVE A BAD LIFE',
                              style: TextStyle(
                                  color: Colors.indigo[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none))
                        ],
                      ),
                    ))
              
            );
  }
}

class Openpic extends StatelessWidget {
  const Openpic ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Positioned(
              top: MediaQuery.of(context).size.width*0.1,
              left: MediaQuery.of(context).size.width*0.7,
              width: 90,
              height: 90,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/LG5.png"))),
              )));
  }
}
