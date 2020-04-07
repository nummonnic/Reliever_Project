import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// import 'package:relieverapp/login.dart';
import 'package:relieverapp/screen/open_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new OpenScreen());
  }
}