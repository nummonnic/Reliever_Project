import 'package:flutter/material.dart';

import '../widget/detail_feedback.dart';

class FeedBackScreen extends StatelessWidget {
  static const routeName = '/detail_feedback-page';
  const FeedBackScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Feedback"
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: <Widget>[
            //     FlatButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         mainAxisSize: MainAxisSize.min,
            //         children: <Widget>[
            //           Icon(
            //             Icons.arrow_back_ios,
            //             color: Colors.black,
            //             size: 25.0,
            //           ),
            //           SizedBox(
            //             width: 5,
            //           ),
            //           Text(
            //             'Back',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 20.0,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
