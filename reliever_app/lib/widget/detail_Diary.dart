import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../database/event_firestore_service.dart';
import '../model/event.dart';
import '../screen/diary/add_event_screen.dart';
import '../screen/diary/view_event.dart';
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: Color(0xff1a3c5a),
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    isDrawerOpen
                        ? IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xffdac6a3),
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
                              color: Color(0xffdac6a3),
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  xOffset = 230;
                                  yOffset = 150;
                                  scaleFactor = 0.6;
                                  isDrawerOpen = true;
                                },
                              );
                            },
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'My Diary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 3, right: 3,),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: isDrawerOpen
                        ? BorderRadius.circular(40)
                        : BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                  ),
                  child: Container(
                    child: DiaryCalenda(),
                  ),
                  // child: Column(
                  //   children: <Widget> [
                  //     DiaryCalenda(),
                  //   ],
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiaryCalenda extends StatefulWidget {
  DiaryCalenda({Key key}) : super(key: key);

  @override
  _DiaryCalendaState createState() => _DiaryCalendaState();
}

class _DiaryCalendaState extends State<DiaryCalenda> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  String _selectedDate;
  var dateNow;
  var formatter;
  String formatted;
  bool _selectedToday = false;
  String _showDate = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    _events = {};
    _selectedEvents = [];
    _selectedDate = "";
    _selectedToday = true;
    // _showDate = "";
    dateNow = DateTime.now();
    // _selectedToday = false;
    // formatter = DateFormat('yyyy-MM-dd');
    // formatted = DateFormat('y-M-d').format(dateNow);
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
    return Container(
      child: StreamBuilder<List<EventModel>>(
        stream: eventDBS.streamList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<EventModel> allEvents = snapshot.data;
            if (allEvents.isNotEmpty) {
              _events = _groupEvents(allEvents);
            }
          }
          return Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TableCalendar(
                    events: _events,
                    calendarStyle: CalendarStyle(
                      outsideStyle: TextStyle(
                        fontSize: 10,
                      ),
                      unavailableStyle: TextStyle(
                        fontSize: 10,
                      ),
                      weekdayStyle: TextStyle(
                        fontSize: 10,
                      ),
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff27496d),
                      ),
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      formatButtonTextStyle: TextStyle(),
                    ),
                    onDaySelected: (date, events) {
                      // print(snapshot);
                      setState(
                        () {
                          // formatted = formatter.format(dateNow);
                          _selectedEvents = events;
                          _selectedDate = DateFormat('y-M-d').format(date);
                          formatted = DateFormat('y-M-d').format(dateNow);
                          _showDate = DateFormat('yMMMMd').format(date);
                          if (_selectedDate == formatted) {
                            _selectedToday = true;
                          } else {
                            _selectedToday = false;
                          }
                          print("Now: " +
                              DateFormat('jm').format(dateNow).toString());
                        },
                      );
                    },
                    builders: CalendarBuilders(
                      selectedDayBuilder: (context, date, events) => Container(
                        margin: EdgeInsets.all(10),
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    // color: Colors.black,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xffdac6a3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 30,
                        right: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _selectedToday
                                  ? Text(
                                      "Today",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    )
                                  : Text(
                                      _showDate,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xffecb45b),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    onPressed: () => Navigator.pushNamed(
                                        context, AddEventScreen.routeName),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              child: ListView(
                                children: <Widget>[
                                  ..._selectedEvents.map(
                                    (event) => Container(
                                      height: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: new BoxDecoration(
                                                    color: Colors.orange,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      event.emotion,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(DateFormat('jm')
                                                        .format(event.eventDate)
                                                        .toString()),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
