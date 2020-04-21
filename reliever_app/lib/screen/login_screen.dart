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
    return new MaterialApp(home: LoginPage());
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
              LogInBack(),
              LogIninfo(),
              LogInpic(),
              LogInNoAcc(),
              // Container(
              //     child: Positioned(
              //         left: MediaQuery.of(context).size.width * 0.4,
              //         top: MediaQuery.of(context).size.height * 0.28,
              //         width: 100,
              //         height: 100,
              //         // height: MediaQuery.of(context).size.height,
              //         child: Container(
              //           decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   image: AssetImage("assets/images/LG5.png"))),
              //         ))),
              Container(
                child: LoginFun(),
              ),
              // Container(
              //   // child: Positioned(
              //   //       left: MediaQuery.of(context).size.width*0.4,
              //   //       top:  MediaQuery.of(context).size.height*0.28,
              //   padding: EdgeInsets.fromLTRB(80, 540, 0, 0),
              //   child: Text('You don\'t have any account?\n',
              //       style: TextStyle(
              //           fontSize: 15,
              //           fontWeight: FontWeight.w400,
              //           color: Colors.indigo[700])),
              //   //)
              // ),
              Container(
                child: GoToSignUpFun(),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class LogIninfo extends StatelessWidget {
  const LogIninfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
      //width: MediaQuery.of(context).size.width*0.65,
      top: MediaQuery.of(context).size.height*0.07,
      left: MediaQuery.of(context).size.width*0.01,
        child:Column(children: <Widget>[
      Container(
        //padding: EdgeInsets.fromLTRB(5, 50, 0, 0),
        child: Text('Welcome',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                color: Colors.indigo[700])),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
        child: Text('to Reliever',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                color: Colors.indigo[700])),
      
      ),
        
    ])
    )
    );
  }
}

class LogInpic extends StatelessWidget {
  const LogInpic ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  child: Positioned(
                      left: MediaQuery.of(context).size.width * 0.4,
                      top: MediaQuery.of(context).size.height * 0.31,
                      
                      width: 100,
                      height: 100,
                      //height: MediaQuery.of(context).size.height,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/LG5.png"))),
                      )
                      ));
  }
}

class LogInNoAcc extends StatelessWidget {
  const LogInNoAcc ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                child: Positioned(
                      left: MediaQuery.of(context).size.width*0.2,
                      top:  MediaQuery.of(context).size.height*0.82,
                //padding: EdgeInsets.fromLTRB(80, 540, 0, 0),
                child: Text('You don\'t have any account?\n',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.indigo[700])),
                )
              );
  }
}

