import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../database/event_firestore_service.dart';
import '../model/event.dart';
import '../screen/add_event_screen.dart';
import '../screen/view_event.dart';
//import '../widget/try.dart';

class DiaryDetail extends StatefulWidget {
  DiaryDetail({Key key}) : super(key: key);

  @override
  _DiaryDetailState createState() => _DiaryDetailState();
}

class _DiaryDetailState extends State<DiaryDetail> {
  double xOffset = 0; //set X axis and Y axis
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    _events = {};
    _selectedEvents = [];
  }

  Map<DateTime, List<dynamic>> _groupEvents(List<EventModel> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach(
      (event) {
        DateTime date = DateTime(event.eventDate.year, event.eventDate.month,
            event.eventDate.day, 12);
        if (data[date] == null) data[date] = [];
        data[date].add(event);
      },
    );
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return AnimatedContainer(
      decoration: BoxDecoration(
        color: Color(0xff27496d),
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Column(
        children: <Widget>[
          SizedBox(height: height - 800),
          Padding(
            padding: EdgeInsets.only(
                left: width - 420,
                right: width - 420,
                top: height - 810,
                bottom: height - 810),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            },
                          );
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            xOffset = width - 213;
                            yOffset = width - 300;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        },
                      ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, AddEventScreen.routeName),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: width - 420),
                    Text(
                      'My Diary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontFamily: "Circular Air Light",
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height - 800),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFf2f2f2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    width - 410, height - 790, width - 410, height - 795),
                child: Scaffold(
                  body: StreamBuilder<List<EventModel>>(
                    stream: eventDBS.streamList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<EventModel> allEvents = snapshot.data;
                        if (allEvents.isNotEmpty) {
                          _events = _groupEvents(allEvents);
                        }
                      }
                      return SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: TableCalendar(
                                    events: _events,
                                    calendarStyle: CalendarStyle(
                                      todayColor: Colors.orangeAccent[100],
                                      selectedColor: Colors.blueGrey,
                                      todayStyle: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    headerStyle: HeaderStyle(
                                      centerHeaderTitle: true,
                                      titleTextStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff27496d),
                                      ),
                                      formatButtonDecoration:
                                          BoxDecoration(color: Colors.white),
                                      formatButtonTextStyle: TextStyle(),
                                    ),
                                    onDaySelected: (date, events) {
                                      setState(
                                        () {
                                          _selectedEvents = events;
                                        },
                                      );
                                    },
                                    builders: CalendarBuilders(
                                      selectedDayBuilder:
                                          (context, date, events) => Container(
                                        margin: EdgeInsets.all(height - 810),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.brown,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          date.day.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    calendarController: _controller,
                                  ),
                                ),
                                ..._selectedEvents.map(
                                  (event) => Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: height - 780,
                                      vertical: width - 420,
                                    ),
                                    child: Card(
                                      color: Color(0xfff5b971),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 5,
                                      child: Padding(
                                        padding: EdgeInsets.all(height - 814),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                event.title,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19,
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        EventDetailsPage(
                                                      event: event,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ), // Scaffold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
