//import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class OpenBack extends StatelessWidget {
  const OpenBack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent[100],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: OBack(),
      ),
    );
  }
}

class OBack extends CustomPainter {
  @override
  Widget build(BuildContext context) {
    return new Container(
        //decoration: new BoxDecoration(color: Colors.red),
        );
  }

  void paint(Canvas canvas, Size size) {
    //final width = size.width;
    // Path recPath = Path();
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
        Rect.fromLTWH(size.width / 6.7, size.height / 2.4, size.width / 1.35, size.height / 4),
        //Rect.fromLTWH(double ),
        Radius.circular(22)));  
    paint.color = Colors.white.withOpacity(0.8);
    canvas.drawPath(recPath, paint);
     

    // recPath.addRRect(
    //   RRect.fromRectAndRadius(Rect.fromLTWH(size.width / 7, size.height / 4.2, size.width * 2.85 / 4, size.height/ 1), Radius.circular(22))
    // );
    // paint.color = Colors.white;
    // canvas.drawPath(recPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

