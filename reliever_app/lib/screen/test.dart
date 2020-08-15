import 'package:flutter/material.dart';

//import '../widget/sample.dart';
import '../widget/processing_question.dart';
import 'drawerScreen.dart';

class SampleTest extends StatelessWidget {
  static const routeName = '/test-screen';
  const SampleTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        //DrawerScreen(),
        ProcessingQuestion(),
      ],
    ));
  }
}
