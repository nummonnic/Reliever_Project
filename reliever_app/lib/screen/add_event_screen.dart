import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../model/event.dart';
import '../database/event_firestore_service.dart';
import '../template/background.dart';

class AddEventScreen extends StatefulWidget {
  final EventModel note;
  static const routeName = '/add_event-page';

  const AddEventScreen({Key key, this.note}) : super(key: key);

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController _title;
  TextEditingController _description;
  DateTime _eventDate;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool processing;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(
        text: widget.note != null ? widget.note.title : "");
    _description = TextEditingController(
        text: widget.note != null ? widget.note.description : "");
    _eventDate = DateTime.now();
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Stack(
      children: <Widget>[
        Container(
          child: BackGround(),
        ),
        Scaffold(
          backgroundColor: Color(0xff27496d),
          key: _key,
          body: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          //print('done');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "      Hello there, \n          Add My Diary",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 450,
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(30),
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: 30,
                          //   vertical: 30,
                          // ),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                cursorColor: Colors.brown,
                                controller: _title,
                                validator: (value) => (value.isEmpty)
                                    ? "Please Enter title"
                                    : null,
                                style: style,
                                decoration: InputDecoration(
                                  labelText: "Title",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              TextFormField(
                                controller: _description,
                                minLines: 3,
                                maxLines: 10,
                                validator: (value) => (value.isEmpty)
                                    ? "Please Enter description"
                                    : null,
                                style: style,
                                decoration: InputDecoration(
                                  labelText: "description",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ListTile(
                                title: Text("Date (YYYY-MM-DD)"),
                                subtitle: Text(
                                  "${_eventDate.year} - ${_eventDate.month} - ${_eventDate.day}",
                                ),
                                onTap: () async {
                                  DateTime picked = await showDatePicker(
                                    context: context,
                                    initialDate: _eventDate,
                                    firstDate: DateTime(_eventDate.year - 5),
                                    lastDate: DateTime(_eventDate.year + 5),
                                  );
                                  if (picked != null) {
                                    setState(
                                      () {
                                        _eventDate = picked;
                                      },
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              processing
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 40,
                                      ),
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: Color(0xFFf5b971),
                                        child: MaterialButton(
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              setState(
                                                () {
                                                  processing = true;
                                                },
                                              );
                                              if (widget.note != null) {
                                                await eventDBS.updateItem(
                                                  EventModel(
                                                    id: widget.note.id,
                                                    title: _title.text,
                                                    description:
                                                        _description.text,
                                                    eventDate:
                                                        widget.note.eventDate,
                                                  ),
                                                );
                                              } else {
                                                await eventDBS.createItem(
                                                  EventModel(
                                                    title: _title.text,
                                                    description:
                                                        _description.text,
                                                    eventDate: _eventDate,
                                                  ),
                                                );
                                              }
                                              Navigator.pop(context);
                                              setState(() {
                                                processing = false;
                                              });
                                            }
                                          },
                                          child: Text(
                                            "Save",
                                            style: style.copyWith(
                                              color: Color(0xFF222831),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
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
                ],
              ),
            ),
          ),
        ),
      ],
    );

    // return Stack(
    //   children: <Widget>[
    //     Container(
    //       child: BackGround(),
    //     ),
    //     Scaffold(
    //       backgroundColor: Color(0xff27496d),
    //       key: _key,
    //       body: Form(
    //         key: _formKey,
    //         child: Container(
    //           alignment: Alignment.center,
    //           child: ListView(
    //             children: <Widget>[
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   IconButton(
    //                     icon: Icon(
    //                       Icons.arrow_back_ios,
    //                       color: Colors.white,
    //                     ),
    //                     onPressed: () {
    //                       //print('done');
    //                       Navigator.pop(context);
    //                     },
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 100,
    //               ),
    //               Text(
    //                 "      Hello there, \n          Add My Diary",
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w900,
    //                   fontSize: 40,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Stack(
    //                 children: <Widget>[
    //                   Align(
    //                     alignment: Alignment.center,
    //                     child: Container(
    //                       height: 100,
    //                       margin: EdgeInsets.symmetric(
    //                         horizontal: 100,
    //                       ),
    //                       decoration: BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(20),
    //                       ),
    //                       padding: EdgeInsets.symmetric(
    //                         horizontal: 100,
    //                         vertical: 200,
    //                       ),
    //                       child: Column(
    //                         children: <Widget>[
    //                           TextFormField(
    //                             cursorColor: Colors.brown,
    //                             controller: _title,
    //                             validator: (value) => (value.isEmpty)
    //                                 ? "Please Enter title"
    //                                 : null,
    //                             style: style,
    //                             decoration: InputDecoration(
    //                               labelText: "Title",
    //                               filled: true,
    //                               fillColor: Colors.white,
    //                               border: OutlineInputBorder(
    //                                 borderRadius: BorderRadius.circular(10),
    //                               ),
    //                             ),
    //                           ),
    //                           SizedBox(height: 100),
    //                           TextFormField(
    //                             controller: _description,
    //                             minLines: 3,
    //                             maxLines: 5,
    //                             validator: (value) => (value.isEmpty)
    //                                 ? "Please Enter description"
    //                                 : null,
    //                             style: style,
    //                             decoration: InputDecoration(
    //                               labelText: "description",
    //                               border: OutlineInputBorder(
    //                                 borderRadius: BorderRadius.circular(10),
    //                               ),
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: 100,
    //                           ),
    //                           ListTile(
    //                             title: Text("Date (YYYY-MM-DD)"),
    //                             subtitle: Text(
    //                               "${_eventDate.year} - ${_eventDate.month} - ${_eventDate.day}",
    //                             ),
    //                             onTap: () async {
    //                               DateTime picked = await showDatePicker(
    //                                 context: context,
    //                                 initialDate: _eventDate,
    //                                 firstDate: DateTime(_eventDate.year - 5),
    //                                 lastDate: DateTime(_eventDate.year + 5),
    //                               );
    //                               if (picked != null) {
    //                                 setState(
    //                                   () {
    //                                     _eventDate = picked;
    //                                   },
    //                                 );
    //                               }
    //                             },
    //                           ),
    //                           SizedBox(
    //                             height: 100,
    //                           ),
    //                           processing
    //                               ? Center(child: CircularProgressIndicator())
    //                               : Padding(
    //                                   padding: EdgeInsets.symmetric(
    //                                     horizontal: 100,
    //                                   ),
    //                                   child: Material(
    //                                     elevation: 5.0,
    //                                     borderRadius:
    //                                         BorderRadius.circular(30.0),
    //                                     color: Color(0xFFf5b971),
    //                                     child: MaterialButton(
    //                                       onPressed: () async {
    //                                         if (_formKey.currentState
    //                                             .validate()) {
    //                                           setState(() {
    //                                             processing = true;
    //                                           });
    //                                           if (widget.note != null) {
    //                                             await eventDBS.updateItem(
    //                                               EventModel(
    //                                                 id: widget.note.id,
    //                                                 title: _title.text,
    //                                                 description:
    //                                                     _description.text,
    //                                                 eventDate:
    //                                                     widget.note.eventDate,
    //                                               ),
    //                                             );
    //                                           } else {
    //                                             await eventDBS.createItem(
    //                                               EventModel(
    //                                                 title: _title.text,
    //                                                 description:
    //                                                     _description.text,
    //                                                 eventDate: _eventDate,
    //                                               ),
    //                                             );
    //                                           }
    //                                           Navigator.pop(context);
    //                                           setState(() {
    //                                             processing = false;
    //                                           });
    //                                         }
    //                                       },
    //                                       child: Text(
    //                                         "Save",
    //                                         style: style.copyWith(
    //                                           color: Color(0xFF222831),
    //                                           fontWeight: FontWeight.bold,
    //                                           fontSize: 25,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }
}
