import 'package:flutter/material.dart';
import 'package:relieverapp/database/event_firestore_service.dart';
import 'package:relieverapp/model/event.dart';
import '../screen/diary_screen.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              event.title,
            ),
            SizedBox(height: 20.0),
            Text(event.description),
            SizedBox(height: 20.0),
            RaisedButton(
                color: Colors.brown,
                textColor: Colors.white,
                child: Text("delete"),
                onPressed: () {
                  _deleteDiary(context, event.id);
                })
          ],
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
    //String id = event.id;
    //print("Id of diary: " + id);
  }

  Future<bool> _showConfirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        content: Text("Do you want to delete this diary or not ?"),
        actions: <Widget>[
          FlatButton(
            color: Colors.red,
            child: Text("delete"),
            onPressed: () => Navigator.pop(context, true),
          ),
          FlatButton(
            color: Colors.blue,
            child: Text("not"),
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
