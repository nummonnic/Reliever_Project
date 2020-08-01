import 'package:flutter/material.dart';
import 'package:relieverapp/widget/try.dart';

import 'drawerScreen.dart';

class Sam extends StatelessWidget {
  static const routeName = '/sample-screen';
  const Sam({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        DrawerScreen(),
        //tryOn(),
      ]),
    );
  }
}
