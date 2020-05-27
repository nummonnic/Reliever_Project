import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../database/event_firestore_service.dart';
import '../model/event.dart';
import '../screen/add_event_screen.dart';
import '../screen/view_event.dart';

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
    events.forEach((event) {
      DateTime date = DateTime(
          event.eventDate.year, event.eventDate.month, event.eventDate.day, 12);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 10.0, bottom: 8.0),
            child: Row(
              children: [
                isDrawerOpen
                    ? IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        })
                    : IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        },
                      ),
                //Text("data")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'My Diary',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontFamily: "Circular Air Light",
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
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
                                      //formatAnimation: FormatAnimation.slide,
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
                                          formatButtonDecoration: BoxDecoration(
                                              color: Colors.white),
                                          formatButtonTextStyle:
                                              TextStyle(color: Colors.white)),
                                      onDaySelected: (date, events) {
                                        setState(() {
                                          _selectedEvents = events;
                                          //print("Date state: " + date.toString());
                                          //print("Event state: " + events.toString());
                                        });
                                      },
                                      builders: CalendarBuilders(
                                        selectedDayBuilder: (context, date,
                                                events) =>
                                            Container(
                                                margin:
                                                    const EdgeInsets.all(5.0),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.brown,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                  date.day.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                      ),
                                      calendarController: _controller,
                                    ),
                                  ),
                                  //Padding(
                                  //  padding: EdgeInsets.only(
                                  //      top: size.height * .4 - 30),
                                  //  child: Column(
                                  //    children: <Widget>[
                                  //      Container(
                                  //          padding: EdgeInsets.symmetric(
                                  //              vertical: 20, horizontal: 30),
                                  //          decoration: BoxDecoration(
                                  //            color: Colors.blue,
                                  //            borderRadius:
                                  //                BorderRadius.circular(38.5),
                                  //            boxShadow: [
                                  //              BoxShadow(
                                  //                  offset: Offset(0, 10),
                                  //                  blurRadius: 33,
                                  //                  color: Colors.amberAccent
                                  //                      .withOpacity(0.84)),
                                  //            ],
                                  //          ),
                                  //          child: Row(
                                  //            children: <Widget>[
                                  //              RichText(
                                  //                  text: TextSpan(children: [
                                  //                TextSpan(
                                  //                    text: "Chapter 1",
                                  //                    style: TextStyle(
                                  //                        fontSize: 16,
                                  //                        color: Colors.black))
                                  //              ]))
                                  //            ],
                                  //          ))
                                  //    ],
                                  //  ),
                                  //),
                                  ..._selectedEvents.map(
                                    (event) => Card(
                                        child:
                                            ListTile(title: Text(event.title))),

                                    //ListTile(

                                    //  title: Text(event.title),
                                    //    onTap: () {
                                    //      Navigator.push(
                                    //          context,
                                    //          MaterialPageRoute(
                                    //              builder: (_) =>
                                    //                  EventDetailsPage(
                                    //                    event: event,
                                    //                  )));
                                    //    },
                                    //),
                                  ),
                                ]),
                          ],
                        ));
                      }),
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.brown,
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, AddEventPage.routeName),
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
