import 'package:flutter/material.dart';

class DiaryScreen extends StatelessWidget {
  static const routeDiary = '/diary-screen';
  @override
  Widget build(BuildContext context) {
    //final routeArgs = ModalRoute.of(context).settings
    return Scaffold(
      appBar: AppBar(
        title: Text('The diary'),
      ),
      body: Center(
        child: Text(
          'go to diary',
        ),
      ),
    );
  }
}
