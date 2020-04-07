import 'package:flutter/material.dart';
import '../widget/side_manu.dart';

class ResultScreen extends StatelessWidget {
  static const routeResult = '/result-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Result'),
      ),
      drawer: SideManu(),
      body: Center(
        child: Text(
          'measure stress',
        ),
      ),
    );
  }
}
