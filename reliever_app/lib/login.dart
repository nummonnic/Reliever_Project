//import 'package:flutter/material.dart';
// import 'package:relieverapp/signup.dart';
// import 'package:relieverapp/home.dart';

// class LogInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: LoginPage());
//   }
// }

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: ListView(
//         children: <Widget>[
//           Container(
//             child: Stack(children: <Widget>[
//               Container(
//                 color: Colors.orangeAccent[100],
//                 // alignment: Alignment.center,
//                 width: 420,
//                 //height: 660,
//                 height: MediaQuery.of(context).size.height,
//                 child: CustomPaint(
//                   painter: MyPainter(),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
//                 child: Text('Welcome',
//                     style: TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.indigo[700])),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(15, 80, 0, 0),
//                 child: Text('to Reliever',
//                     style: TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.indigo[700])),
//               ),
//               Container(
//                   child: Positioned(
//                       left: 155,
//                       top: 160,
//                       width: 100,
//                       height: 100,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage("assets/images/LG5.png"))),
//                       ))),
//               Container(
//                   child: Positioned(
//                 left: 75,
//                 top: 310,
//                 width: 260,
//                 height: 50,
//                 child: TextField(
//                   // obscureText: true,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       borderSide:
//                           BorderSide(width: 3, color: Colors.indigo[700]),
//                     ),
//                     labelText: 'Username',
//                   ),
//                 ),
//               )),
//               Container(
//                   child: Positioned(
//                 left: 75,
//                 top: 380,
//                 width: 260,
//                 height: 50,
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       borderSide:
//                           BorderSide(width: 3, color: Colors.indigo[700]),
//                     ),
//                     labelText: 'Password',
//                   ),
//                 ),
//               )),
//               Container(
//                 width: 450.0,
//                 height: 520.0,
//                 padding: EdgeInsets.only(left: 70, right: 70, top: 470),
//                 child: RaisedButton(
//                     child: Text('Login',
//                         style: TextStyle(color: Colors.white, fontSize: 20)),
//                     color: Colors.indigo[700],
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => new HomeScreen()));
//                     }),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(80, 540, 0, 0),
//                 child: Text('You don\'t have any account?\n',
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.indigo[700])),
//               ),
//               Container(
//                   padding: EdgeInsets.only(left: 260, top: 525),
//                   child: FlatButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => new SignUpScreen()));
//                     },
//                     child: Text("Sign Up",
//                         style: TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.w900,
//                             color: Colors.indigo[700])),
//                   ))
              //           TextFormField(
              //             obscureText: true,
              //             decoration: const InputDecoration(
              //               labelText: 'Password',
              //             ),
              // //  validator: (String value) {
              // //    if (value.trim().isEmpty) {
              // //      return 'Password is required';
              // //    }
              // //  },
              //           ),
//             ]),
//           )
//         ],
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     //final width = size.width;

//     Paint paint = Paint();
//     Path recPath = Path();
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

//     recPath.addRRect(RRect.fromRectAndRadius(
//         Rect.fromLTWH(size.width / 7, size.height / 4.2, size.width * 2.85 / 4,
//             size.height / 1.5),
//         Radius.circular(22)));
//     paint.color = Colors.white;
//     canvas.drawPath(recPath, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
