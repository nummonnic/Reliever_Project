import 'package:flutter/material.dart';

import '../model/config_menu.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int selectedMenu = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: Color(0xff698474),
      padding: EdgeInsets.only(top: 50, bottom: 20, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Active Status",
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
          Column( 
            children: drawerItems
                .map((element) => GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(element['route']);
                                selectedMenu = element['selectState'];
                                //print("Select: " + context.toString());
                              },
                              child: Icon(
                                element['icon'],
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Text(
                                element['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(element['route']);
                                selectedMenu = element['selectState'];
                              },
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          Row(children: [
            Icon(
              Icons.settings,
              color: Colors.white54,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Settings",
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 2,
              height: 20,
              color: Colors.white54,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Log out",
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            )
          ])
        ],
      ),
    );
  }
}
