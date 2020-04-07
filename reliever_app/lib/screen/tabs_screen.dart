import 'package:flutter/material.dart';
import 'diary_screen.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Reliever'),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'category',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'favorite',
              )
            ]),
          ),
          body: TabBarView(children: <Widget>[
            DiaryScreen(),
            DiaryScreen(),
          ]),
        ));
  }
}
