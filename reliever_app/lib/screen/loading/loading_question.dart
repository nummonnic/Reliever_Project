import 'package:flutter/material.dart';

//import '../widget/sample.dart';
import '../../widget/processing.dart';
import '../drawerScreen.dart';

class LoadingProcess extends StatelessWidget {
  static const routeName = '/loadingProcess-screen';
  const LoadingProcess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DrawerScreen(),
          Processing(),
        ],
      ),
    );
  }
}
