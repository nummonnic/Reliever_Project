import 'package:flutter/material.dart';

import '../screen/diary_screen.dart';
import '../screen/result_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.orange[600],
            child: Text(
              'Reliever application',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Colors.black26),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Function', Icons.local_activity, () {
            Navigator.of(context).pushNamed('/');
          }),
          buildListTile('diary', Icons.calendar_today, () {
            Navigator.of(context).pushNamed(DiaryScreen.routeDiary);
          }),
          buildListTile('result', Icons.score, () {
            Navigator.of(context).pushNamed(ResultScreen.routeResult);
          }),
        ],
      ),
    );
  }
}
