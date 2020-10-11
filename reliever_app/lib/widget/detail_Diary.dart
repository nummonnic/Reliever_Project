import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
        color: Color(0xff27496d),
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
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
                ],
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'My Diary',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: "Circular Air Light",
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
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
              child: ListView(
                children: <Widget>[
                  DiaryCalenda(),
                ],
              ),
            ),
          ),
        ],
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
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Container(
          child: StreamBuilder<List<EventModel>>(
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
                                formatButtonDecoration:
                                    BoxDecoration(color: Colors.white),
                                formatButtonTextStyle: TextStyle(),
                              ),
                              onDaySelected: (date, events) {
                                print(snapshot);
                                setState(
                                  () {
                                    _selectedEvents = events;
                                  },
                                );
                              },
                              builders: CalendarBuilders(
                                selectedDayBuilder: (context, date, events) =>
                                    Container(
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
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color(0xffc98a3c),
                            ),
                            height: MediaQuery.of(context).size.height * 0.28,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                   
                                    child: Column(
                                      children: <Widget>[
                                        ..._selectedEvents.map(
                                          (event) => Padding(
                                            padding: EdgeInsets.only(
                                              top: 10,
                                              left: 10,
                                              right: 10,
                                            ),
                                            child: Container(
                                              height: 100,
                                              child: Card(
                                                color: Color(0xffe6d4c1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                elevation: 5,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    // Row(
                                                    //   // mainAxisAlignment: MainAxisAlignment.end,
                                                    //   children: <Widget>[
                                                    GestureDetector(
                                                      child: Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: <
                                                                    Widget>[
                                                                  Icon(
                                                                    Icons
                                                                        .arrow_forward_ios,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 20,
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            30),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        // Container(
                                                                        //   height: 10,
                                                                        //   color: Colors.amber,
                                                                        // ),
                                                                        // Text(
                                                                        //     "photo"),
                                                                        SizedBox(
                                                                          width:
                                                                              40,
                                                                        ),
                                                                        Text(
                                                                          event
                                                                              .title,
                                                                          style:
                                                                              TextStyle(fontSize: 25),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
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
                                                    //   ],
                                                    // ),
                                                    // InkWell(
                                                    //   child: Container(
                                                    //     height: 10,
                                                    //     child: Container(
                                                    //       // padding: EdgeInsets.all(20),
                                                    //       child: Text("data"),
                                                    //     ),

                                                    //     // child: Padding(
                                                    //     //   padding:
                                                    //     //       const EdgeInsets
                                                    //     //           .all(10.0),
                                                    //     //   child: Column(
                                                    //     //     children: <Widget>[
                                                    //     //       Text(event.title,),
                                                    //     //       // Row(
                                                    //     //       //   mainAxisAlignment:
                                                    //     //       //       MainAxisAlignment
                                                    //     //       //           .end,
                                                    //     //       //   children: <Widget>[
                                                    //     //       //     IconButton(
                                                    //     //       //       icon: Icon(Icons
                                                    //     //       //           .arrow_forward, color: Colors.black,),
                                                    //     //       //       onPressed:
                                                    //     //       //           () {},
                                                    //     //       //     ),
                                                    //     //       //   ],
                                                    //     //       // ),
                                                    //     //       // Text("data")
                                                    //     //     ],
                                                    //     //   ),
                                                    //     // ),
                                                    //   ),
                                                    // ),
                                                    // Container(
                                                    //   height: 10,
                                                    // ),
                                                    // ListTile(

                                                    //   // title: Text(
                                                    //   //   event.title,
                                                    //   //   style: TextStyle(
                                                    //   //     color: Colors.white,
                                                    //   //     fontSize: 19,
                                                    //   //   ),
                                                    //   // ),
                                                    //   onTap: () {
                                                    //     Navigator.push(
                                                    //       context,
                                                    //       MaterialPageRoute(
                                                    //         builder: (_) =>
                                                    //             EventDetailsPage(
                                                    //           event: event,
                                                    //         ),
                                                    //       ),
                                                    //     );
                                                    //   },
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // child: ListView(
                            //   ..._selectedEvents.map(),
                            // ),
                            // ..._selectedEvents.map(),
                          ),
                        ),

                        // ..._selectedEvents.map(
                        //   (event) =>
                        //   // Padding(
                        //   //   padding: EdgeInsets.all(10),
                        //   //   child: Container(
                        //   //     color: Colors.amber,
                        //   //     height: 20,
                        //   //   ),
                        //   // ),
                        //   ),

                        //     // Expanded(
                        //     //   child: Container(
                        //     //     // decoration: BoxDecoration(
                        //     //     //   color: Colors.black,
                        //     //     //   borderRadius: BorderRadius.circular(20)
                        //     //     // ),
                        //     //   ),
                        //     // ),
                        //     // child: Card(
                        //     //   color: Color(0xfff5b971),
                        //     //   shape: RoundedRectangleBorder(
                        //     //     borderRadius: BorderRadius.circular(15.0),
                        //     //   ),
                        //     //   elevation: 5,
                        //     //   child: Padding(
                        //     //     padding: EdgeInsets.all(5),
                        //     //     child: Column(
                        //     //       mainAxisSize: MainAxisSize.min,
                        //     //       children: <Widget>[
                        //     //         ListTile(
                        //     //           title: Text(
                        //     //             event.title,
                        //     //             style: TextStyle(
                        //     //               color: Colors.white,
                        //     //               fontSize: 19,
                        //     //             ),
                        //     //           ),
                        //     //           onTap: () {
                        //     //             Navigator.push(
                        //     //               context,
                        //     //               MaterialPageRoute(
                        //     //                 builder: (_) => EventDetailsPage(
                        //     //                   event: event,
                        //     //                 ),
                        //     //               ),
                        //     //             );
                        //     //           },
                        //     //         ),
                        //     //       ],
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget ListContent(List<dynamic> _selectedEvents) {
  //   return _selectedEvents.map((e) => null);
  // }
}
