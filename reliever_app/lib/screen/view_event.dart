import 'package:flutter/material.dart';
import 'package:relieverapp/database/event_firestore_service.dart';
import 'package:relieverapp/model/event.dart';
import '../screen/diary_screen.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: height - 686,
              left: width - 332,
              child: Text(
                event.eventDate.day.toString(),
                style: TextStyle(
                  fontSize: 160,
                  color: Colors.grey.withOpacity(0.12),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Positioned(
              right: width - 472,
              top: height - 796,
              child: Image.asset(
                'assets/images/Asset7.png',
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: height - 516,
                    ),
                    Text(
                      event.title,
                      style: TextStyle(
                        fontSize: 56,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      event.eventDate.year.toString() +
                          " - " +
                          event.eventDate.month.toString() +
                          " - " +
                          event.eventDate.day.toString(),
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: height - 796,
                    ),
                    Text(
                      event.description,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height - 716,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          height: height - 750,
                          margin: EdgeInsets.symmetric(horizontal: 130),
                          decoration: BoxDecoration(
                            color: Color(0xff27496d),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        onTap: () {
                          _deleteDiary(context, event.id);
                        },
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: width - 430),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
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
