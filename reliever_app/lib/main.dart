import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:relieverapp/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(children: <Widget>[
      Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.orangeAccent[100],
              alignment: Alignment.center,
              width: 420,
              //height: 660,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: MyPainter(),
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
                    ))),
            // ButtonTheme(
            //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            //   minWidth: 300.0,
            //   height: 30.0,
            //   child: RaisedButton(
            //     onPressed: () {},
            //     child: Text('Let\'s Login\n',
            //     style: TextStyle(color: Colors.white, fontSize: 20,)),
            //     color: Colors.cyan[200],
            //     shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20)
            //   ),
            //   ),
            // ),

            // Stack(
            //   children: [
            //     Positioned(
            //       top: 50,
            //       left: 50,
            //       child: RaisedButton(
            //   child: Text('Let\'s Login\n',
            //   style: TextStyle(color: Colors.white, fontSize: 20)),
            //   color: Colors.cyan[200],
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20)
            //   ),
            //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //   onPressed: (){})
            //     )
            //   ],
            // )
            Container(
              width: 500.0,
              height: 600.0,
              //constraints: BoxConstraints.expand(),
              padding: EdgeInsets.only(left: 65, right: 50, top: 550),
              child: RaisedButton(
                  child: Text('Let\'s Login\n',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  color: Colors.cyan[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new LogInScreen()));
                  }),
            ),
          ],
        ),
      ),
    ]));
  }
}
//       title: 'Login',
//       home: Scaffold(
//       body: ListView(
//         children: <Widget>[
//           Container(
//         child: Stack(
//           children: <Widget>[
//         Container(
//         color: Colors.orangeAccent[100],
//         alignment: Alignment.center,
//         width: 420,
//         height: 700,
//         child: CustomPaint(
//           painter: MyPainter(),
//           child: Align(
//             alignment: Alignment(0.0, 0.1),
//             child: RichText(
//             text: TextSpan(
//               style: DefaultTextStyle.of(context).style,
//               children: <TextSpan>[
//                 TextSpan(
//                   text: '    JUST BECAUSE YOU\n',
//                   style: TextStyle(color: Colors.indigo[700], fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                     TextSpan(
//                       text: '       HAVE A BAD DAY\n',
//                       style: TextStyle(color: Colors.indigo[700], fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     TextSpan(
//                       text: '    DOESN\'T MEAN YOU\n',
//                       style: TextStyle(color: Colors.indigo[700], fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     TextSpan(
//                       text: '       HAVE A BAD LIFE',
//                       style: TextStyle(color: Colors.indigo[700], fontSize: 20, fontWeight: FontWeight.bold)
//                 )
//               ],
//             ),
//           )
//           ),
//         ),
//       ),
//           Container(
//               padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
//               child: Text('Welcome', style: TextStyle( fontSize: 40, fontWeight: FontWeight.w300, color: Colors.indigo[700])),
//             ),
//             Container(
//               padding: EdgeInsets.fromLTRB(15, 100, 0, 0),
//               child: Text('to Reliever', style: TextStyle( fontSize: 40, fontWeight: FontWeight.w300, color: Colors.indigo[700])),
//             ),
//             Container(
//               child: Positioned(
//                 left: 300, top: 30, width: 80, height: 80,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("assets/LG5.png")
//                     )
//                 ),
//               )
//               )
//             ),
//             // ButtonTheme(
//             //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//             //   minWidth: 300.0,
//             //   height: 30.0,
//             //   child: RaisedButton(
//             //     onPressed: () {},
//             //     child: Text('Let\'s Login\n',
//             //     style: TextStyle(color: Colors.white, fontSize: 20,)),
//             //     color: Colors.cyan[200],
//             //     shape: RoundedRectangleBorder(
//             //     borderRadius: BorderRadius.circular(20)
//             //   ),
//             //   ),
//             // ),

//             // Stack(
//             //   children: [
//             //     Positioned(
//             //       top: 50,
//             //       left: 50,
//             //       child: RaisedButton(
//             //   child: Text('Let\'s Login\n',
//             //   style: TextStyle(color: Colors.white, fontSize: 20)),
//             //   color: Colors.cyan[200],
//             //   shape: RoundedRectangleBorder(
//             //     borderRadius: BorderRadius.circular(20)
//             //   ),
//             //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//             //   onPressed: (){})
//             //     )
//             //   ],
//             // )
//             Container(
//             width: 500.0,
//             height: 600.0,
//             padding: EdgeInsets.only(left:65, right: 50, top: 550),
//             child: RaisedButton(
//               child: Text('Let\'s Login\n',
//               style: TextStyle(color: Colors.white, fontSize: 20)),
//               color: Colors.cyan[200],
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20)
//               ),
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//               onPressed: (){
//                 Navigator.push(context,
//                 MaterialPageRoute(builder: (context)=>LogInScreen()));
//               }),
//             )
//           ],
//         ),
//       ),
//       ]
//       )
//       )
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orangeAccent[100],
//       body: CustomPaint(
//         painter: MyPainter(),
//       ),
//     );
//   }
// }

class MyPainter extends CustomPainter {
  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    //final width = size.width;

    Paint paint = Paint();
    Path recPath = Path();
    Path pigPath = Path();
    Path ovalPath = Path();

    pigPath.moveTo(0, size.height * 0.417);
    pigPath.quadraticBezierTo(size.width * 0.25, size.height * 0.6,
        size.width * 0.5, size.height * 0.37);
    pigPath.quadraticBezierTo(size.width * 0.7, size.height * 0.23,
        size.width * 1.0, size.height * 0.2);
    pigPath.lineTo(size.width, size.height);
    pigPath.lineTo(0, size.height);
    paint.color = Colors.cyan[100];
    canvas.drawPath(pigPath, paint);

    ovalPath.moveTo(0, size.height * 0.3);
    ovalPath.quadraticBezierTo(size.width * 0.55, size.height * 0.3,
        size.width * 0.77, size.height * 0.625);
    ovalPath.quadraticBezierTo(size.width * 0.87, size.height * 0.7284,
        size.width * 1.0, size.height * 0.5767);
    ovalPath.lineTo(size.width, size.height);
    ovalPath.lineTo(0, size.height);
    paint.color = Colors.indigo[700];
    canvas.drawPath(ovalPath, paint);

    recPath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width / 7, size.height / 2.4, size.width * 3 / 4,
            size.height / 4),
        Radius.circular(22)));
    paint.color = Colors.white.withOpacity(0.8);
    canvas.drawPath(recPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
