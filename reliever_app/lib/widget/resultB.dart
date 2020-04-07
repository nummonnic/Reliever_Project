import 'package:flutter/material.dart';

// import 'package:relieverapp/home.dart';
//import 'package:relieverapp/screen/signup_screen.dart';
class GoToResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450.0,
      height: 450.0,
      padding: EdgeInsets.only(left: 70, right: 70, top: 400),
      child: RaisedButton(
        child:
            Text('Score', style: TextStyle(color: Colors.white, fontSize: 20)),
        color: Colors.orangeAccent[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        onPressed: (){
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => new LogInScreen()));
                  }
      ),
    );
  }
}
