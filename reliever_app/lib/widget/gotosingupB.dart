import 'package:flutter/material.dart';
// import 'package:relieverapp/home.dart';
import 'package:relieverapp/screen/signup_screen.dart';
class GoToSignUpFun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
      //width: MediaQuery.of(context).size.width*0.65,
      top: MediaQuery.of(context).size.height*0.797,
      left: MediaQuery.of(context).size.width*0.63,
                  //padding: EdgeInsets.only(left: 260, top: 525),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SignUpScreen()));
                    },
                    child: Text("Sign Up",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.indigo[700])),
                  )
    )
    );
             
  
  }
}