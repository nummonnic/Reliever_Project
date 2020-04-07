// import 'package:flutter/material.dart';
// // import 'package:relieverapp/login.dart';
// import 'package:relieverapp/screen/login_screen.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//             backgroundColor: Colors.orangeAccent[100], elevation: 0.0),
//         drawer: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: new Drawer(
//               child: Container(
//                   color: Colors.yellow[100],
//                   child: ListView(
//                     children: <Widget>[
//                       new UserAccountsDrawerHeader(
//                         decoration: BoxDecoration(
//                           color: Colors.yellow[200],
//                         ),
//                         accountName: new Text('Nutty',
//                             style: TextStyle(
//                                 fontSize: 25, color: Colors.indigo[700])),
//                         accountEmail: null,
//                         currentAccountPicture: new CircleAvatar(
//                             child: new Image.asset(
//                           'assets/images/Asset7.png',
//                         )),
//                       ),
//                       Container(
//                           child: Align(
//                               alignment: Alignment.bottomCenter,
//                               //go to bottom
//                               child: Container(
//                                   child: Column(
//                                 children: <Widget>[
//                                   Divider(),
//                                   ListTile(
//                                       leading: Icon(Icons.exit_to_app),
//                                       title: Text('Logout'),
//                                       onTap: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     LogInScreen()));
//                                       })
//                                 ],
//                               ))))
//                     ],
//                   ))),
//         ),
//         body: ListView(children: <Widget>[
//           Container(
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   color: Colors.orangeAccent[100],
//                   // alignment: Alignment.center,
//                   width: 420,
//                   height: 605,
//                   child: CustomPaint(
//                     painter: MyPainter(),
//                   ),
//                 ),
//                 Container(
//                     child: Positioned(
//                         left: 130,
//                         top: 80,
//                         width: 150,
//                         height: 150,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image:
//                                       AssetImage("assets/images/Asset7.png"))),
//                         ))),
//                 Container(
//                   width: 450.0,
//                   height: 450.0,
//                   padding: EdgeInsets.only(left: 70, right: 70, top: 400),
//                   child: RaisedButton(
//                       child: Text('Score',
//                           style: TextStyle(color: Colors.white, fontSize: 20)),
//                       color: Colors.orangeAccent[100],
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => new HomeScreen()));
//                       }),
//                 ),
//                 Container(
//                   width: 450.0,
//                   height: 370.0,
//                   padding: EdgeInsets.only(left: 70, right: 70, top: 320),
//                   child: RaisedButton(
//                       child: Text('My diary',
//                           style: TextStyle(color: Colors.white, fontSize: 20)),
//                       color: Colors.orangeAccent[100],
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => new HomeScreen()));
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         ]));
//   }
// }

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     //final width = size.width;
//     // Path recPath = Path();
//     Paint paint = Paint();
//     Path pigPath = Path();
//     Path ovalPath = Path();

//     pigPath.moveTo(0, size.height * 0.717);
//     pigPath.quadraticBezierTo(size.width * 0.2, size.height * 0.25,
//         size.width * 1.0, size.height * 0.2);
//     // pigPath.quadraticBezierTo(size.width * 0.7, size.height * 0.23,
//     //     size.width * 1.0, size.height * 0.2);
//     pigPath.lineTo(size.width, size.height);
//     pigPath.lineTo(0, size.height);
//     paint.color = Colors.cyan[100];
//     canvas.drawPath(pigPath, paint);

//     ovalPath.moveTo(0, size.height * 0.55);
//     ovalPath.quadraticBezierTo(size.width * 0.4, size.height * 0.5,
//         size.width * 0.77, size.height * 0.825);
//     ovalPath.quadraticBezierTo(size.width * 0.9, size.height * 0.9284,
//         size.width * 1.0, size.height * 0.87);
//     ovalPath.lineTo(size.width, size.height);
//     ovalPath.lineTo(0, size.height);
//     paint.color = Colors.indigo[700];
//     canvas.drawPath(ovalPath, paint);

//     // recPath.addRRect(
//     //   RRect.fromRectAndRadius(Rect.fromLTWH(size.width / 7, size.height / 4.2, size.width * 2.85 / 4, size.height/ 1), Radius.circular(22))
//     // );
//     // paint.color = Colors.white;
//     // canvas.drawPath(recPath, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
