import 'package:flutter/material.dart';
//import 'package:relieverapp/home.dart';
import 'package:relieverapp/screen/home_screen.dart';
//import 'package:relieverapp/screen/login_screen.dart';

class LoginFun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 80.0, right: 80.0, top: 300),
    // padding: EdgeInsets.all(60.0),
    child: Column(
      children: <Widget>[
        TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(width: 3, color: Colors.indigo[700]),
                    ),
                    labelText: 'Password',
                  ),
                ),
        TextField(
                  // obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(width: 3, color: Colors.indigo[700]),
                    ),
                    labelText: 'Username',
                  ),
                ),
    Container(
      width: 300,
      margin: const EdgeInsets.only(top: 40),
        child: RaisedButton(
          child: Text('Login',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    color: Colors.indigo[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }),
      )
      ],
    ),
  );
             
  
  }
}