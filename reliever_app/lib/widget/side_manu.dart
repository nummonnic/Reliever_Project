import 'package:flutter/material.dart';
//import 'package:relieverapp/screen/login_screen.dart';
import 'package:relieverapp/screen/open_screen.dart';
import '../screen/diary_screen.dart';
import '../screen/result_screen.dart';
import '../screen/trackProgress_screen.dart';
//import '../screen/homepage_screen.dart';

class SideManu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: new Drawer(
          child: Container(
              color: Colors.yellow[100],
              child: ListView(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.yellow[200],
                    ),
                    accountName: new Text('Nutty',
                        style:
                            TextStyle(fontSize: 25, color: Colors.indigo[700])),
                    accountEmail: null,
                    currentAccountPicture: new CircleAvatar(
                        child: new Image.asset(
                      'assets/images/Asset7.png',
                    )),
                  ),
                  Container(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          //go to bottom
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Divider(),
                              ListTile(
                                  leading: Icon(Icons.score),
                                  title: Text('Score'),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(ResultScreen.route);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             OpenScreen()));
                                  }),
                              ListTile(
                                  leading: Icon(Icons.calendar_today),
                                  title: Text('Diary'),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(DiaryScreen.routeName);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             OpenScreen()));
                                  }),
                              ListTile(
                                  leading: Icon(Icons.attachment),
                                  title: Text('Progrss'),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(TrackProgress.routeName);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             OpenScreen()));
                                  }),
                              ListTile(
                                  leading: Icon(Icons.exit_to_app),
                                  title: Text('Logout'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OpenScreen()));
                                  })
                            ],
                          ))))
                ],
              ))),
    );
  }
}
