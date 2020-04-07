import 'package:flutter/material.dart';
// import 'package:relieverapp/signup.dart';
//import 'package:relieverapp/screen/home_screen.dart';
// import 'package:relieverapp/home.dart';
import 'package:relieverapp/widget/loginBG.dart';
import 'package:relieverapp/widget/login_func.dart';
import 'package:relieverapp/widget/gotosingupB.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage());
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Stack(children: <Widget>[
              Container(
                color: Colors.orangeAccent[100],
                // alignment: Alignment.center,
                width: 420,
                height: 660,
                child: CustomPaint(
                  painter: LogInBack(),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: Text('Welcome',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: Colors.indigo[700])),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 80, 0, 0),
                child: Text('to Reliever',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: Colors.indigo[700])),
              ),
              Container(
                  child: Positioned(
                      left: 155,
                      top: 180,
                      width: 100,
                      height: 100,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/LG5.png"))),
                      ))),
                      Container(
                        child: LoginFun(),
                      ),
              Container(
                padding: EdgeInsets.fromLTRB(80, 540, 0, 0),
                child: Text('You don\'t have any account?\n',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.indigo[700])),
              ),
              Container(
                  child: GoToSignUpFun(),
                  )
            ]),
          )
        ],
      ),
    );
  }
}

