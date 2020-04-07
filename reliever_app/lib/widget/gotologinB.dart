import 'package:flutter/material.dart';
// import 'package:relieverapp/login.dart';
import 'package:relieverapp/screen/login_screen.dart';
class GoToLogB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
            Container(
              width: 500.0,
              height: 600.0,
              padding: EdgeInsets.only(left: 65, right: 50, top: 550),
              child: RaisedButton(
                  child: Text('Let\'s Login\n',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  color: Colors.cyan[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new LogInScreen()));
                  }
                  ),
            
            );
    
        
  }
}
