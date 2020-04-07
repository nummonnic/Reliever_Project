import 'package:flutter/material.dart';
import 'package:relieverapp/widget/main_drawer.dart';
import './diary_screen.dart';
import 'result_screen.dart';
import '../screen/homepage_screen.dart';
import '../widget/main_drawer.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar:
              AppBar(backgroundColor: Colors.orangeAccent[100], elevation: 0.0),
          drawer: MainDrawer(),
          body: TabBarView(children: <Widget>[
            homeScreen(),
            DiaryScreen(),
            ResultScreen(),
          ]),
        ));
  }
}
