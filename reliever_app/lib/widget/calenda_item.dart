import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import '../screen/add_event_screen.dart';
import '../screen/view_event.dart';

class Calenda extends StatefulWidget {
  @override
  _calendaState createState() => _calendaState();
}

class _calendaState extends State<Calenda> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  //TextEditingController _eventController;
  //SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    _events = {};
    //_eventController = TextEditingController();
    _selectedEvents = [];
    //initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            events: _events,
            //formatAnimation: FormatAnimation.slide,
            calendarStyle: CalendarStyle(
                todayColor: Colors.orangeAccent[100],
                selectedColor: Colors.blueGrey,
                todayStyle: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                )),
            onDaySelected: (date, events) {
              setState(() {
                _selectedEvents = events;
                //print("Date state: " + date.toString());
                //print("Event state: " + events.toString());
              });
            },
            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            calendarController: _controller,
          ),
          ..._selectedEvents.map((event) => ListTile(
                title: Text(event),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EventDetailsPage(
                                event: event,
                              )));
                },
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, AddEventPage.routeName),
      ),
    );
  }
}
