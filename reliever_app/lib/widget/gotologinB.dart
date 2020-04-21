import 'package:flutter/material.dart';
// import 'package:relieverapp/login.dart';
import 'package:relieverapp/screen/login_screen.dart';

class GoToLogB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Positioned(
          // width:20,
          // height:20,
      top: MediaQuery.of(context).size.height * 0.75,
      left: MediaQuery.of(context).size.width * 0.17,
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.07,
      child: RaisedButton(
          child: Text('Let\'s Login\n',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.cyan[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new LogInScreen()));
          }),
    ));
  }
}
