//import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class LogInBack extends StatelessWidget {
  const LogInBack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent[100],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: LogBack(),
      ),
    );
  }
}

class LogBack extends CustomPainter {
  @override
  Widget build(BuildContext context) {
    return new Container(
        //decoration: new BoxDecoration(color: Colors.red),
        );
  }

  void paint(Canvas canvas, Size size) {
   Paint paint = Paint();
    Path recPath = Path();
    Path pigPath = Path();
    Path ovalPath = Path();

    pigPath.moveTo(0, size.height * 0.717);
    pigPath.quadraticBezierTo(size.width * 0.2, size.height * 0.25,
        size.width * 1.0, size.height * 0.2);
    // pigPath.quadraticBezierTo(size.width * 0.7, size.height * 0.23,
    //     size.width * 1.0, size.height * 0.2);
    pigPath.lineTo(size.width, size.height);
    pigPath.lineTo(0, size.height);
    paint.color = Colors.cyan[100];
    canvas.drawPath(pigPath, paint);

    ovalPath.moveTo(0, size.height * 0.55);
    ovalPath.quadraticBezierTo(size.width * 0.4, size.height * 0.5,
        size.width * 0.77, size.height * 0.825);
    ovalPath.quadraticBezierTo(size.width * 0.9, size.height * 0.9284,
        size.width * 1.0, size.height * 0.87);
    ovalPath.lineTo(size.width, size.height);
    ovalPath.lineTo(0, size.height);
    paint.color = Colors.indigo[700];
    canvas.drawPath(ovalPath, paint);

    recPath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width / 7, size.height / 3.7, size.width /1.35, size.height / 1.6),
        Radius.circular(22)));
    paint.color = Colors.white;
    canvas.drawPath(recPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



// import 'package:flutter/material.dart';
// // import 'dart:ui' as ui;
// class LogInBack extends CustomPainter {
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
//         Rect.fromLTWH(size.width / 7, size.height / 4.2, size.width /1.35, size.height / 1.6),
//         Radius.circular(22)));
//     paint.color = Colors.white;
//     canvas.drawPath(recPath, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
