import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const routeResult = '/result-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Result'),
      ),
      body: Center(
        child: Text(
          'measure stress',
        ),
      ),
    );
  }
}
