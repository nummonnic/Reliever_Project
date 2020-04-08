import 'package:flutter/material.dart';
import '../widget/side_manu.dart';

class DiaryScreen extends StatelessWidget {
  static const routeName = '/diary-screen';
  @override
  Widget build(BuildContext context) {
    //final routeArgs = ModalRoute.of(context).settings
    return Scaffold(
      appBar: AppBar(
        title: Text('The diary'),
      ),
       drawer: SideManu(),
      body: Center(
        child: Text(
          'go to diary',
        ),
      ),
    );
  }
}
