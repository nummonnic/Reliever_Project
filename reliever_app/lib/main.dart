import 'package:flutter/material.dart';

//import './screen/home_screen.dart';
import './screen/homepage_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reliever',
      home: homeScreen(),
    );
  }
}
