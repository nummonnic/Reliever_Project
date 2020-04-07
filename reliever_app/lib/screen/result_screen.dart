import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
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
