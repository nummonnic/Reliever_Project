import 'package:flutter/material.dart';
class HomeBack extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //final width = size.width;
    // Path recPath = Path();
    Paint paint = Paint();
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

    // recPath.addRRect(
    //   RRect.fromRectAndRadius(Rect.fromLTWH(size.width / 7, size.height / 4.2, size.width * 2.85 / 4, size.height/ 1), Radius.circular(22))
    // );
    // paint.color = Colors.white;
    // canvas.drawPath(recPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
