import 'package:flutter/material.dart';
import 'package:relieverapp/database/event_firestore_service.dart';
import 'package:relieverapp/model/event.dart';
import './diary_screen.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;
 
  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 25.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                // height: 500,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 130,
                          width: 130,
                          color: Colors.brown,
                          child: Center(
                            child: Text(
                              "photo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      event.emotion,
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      event.eventDate.year.toString() +
                                          " - " +
                                          event.eventDate.month.toString() +
                                          " - " +
                                          event.eventDate.day.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Container(
                                  height: 1.0,
                                  width: 250,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      event.description,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        color: Color(0xff27496d),
        child: GestureDetector(
          onTap: () {
            _deleteDiary(context, event.id);
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Delete Diary',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _deleteDiary(BuildContext context, String id) async {
    if (await _showConfirmDialog(context)) {
      try {
        eventDBS.removeItem(id);
        Navigator.of(context).pushNamed(DiaryScreen.routeName);
      } catch (e) {
        print("error of delete diary: " + e);
      }
    }
  }

  Future<bool> _showConfirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xff27496d),
        content: Text(
          "Do you want to delete this diary or not ?",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            color: Colors.red,
            child: Text(
              "delete",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
          FlatButton(
            color: Colors.blue,
            child: Text(
              "not",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(
              context,
              false,
            ),
          ),
        ],
      ),
    );
  }
}
