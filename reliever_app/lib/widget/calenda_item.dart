import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class calenda extends StatefulWidget {
  @override
  _calendaState createState() => _calendaState();
}

class _calendaState extends State<calenda> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    _events = {};
    _eventController = TextEditingController();
    _selectedEvents = [];
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
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
              //print(date.toIso8601String());
              setState(() {
                _selectedEvents = events;
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
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }

  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _eventController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('save'),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;
                    setState(() {
                      if (_events[_controller.selectedDay] != null) {
                        _events[_controller.selectedDay]
                            .add(_eventController.text);
                      } else {
                        _events[_controller.selectedDay] = [
                          _eventController.text
                        ];
                      }
                      _eventController.clear();
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            ));
  }
}
