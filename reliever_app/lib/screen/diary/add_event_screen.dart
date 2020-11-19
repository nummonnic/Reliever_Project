import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:relieverapp/screen/summary_diary.dart';
import 'package:intl/intl.dart';

import '../../model/event.dart';
import '../../database/event_firestore_service.dart';
import './add_voice_screen.dart';
import '../../model/predict_emotion.dart';

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
  double xOffset = 0; //set X axis and Y axis
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  String selectedDate = "";
  String diary = "";

  GlobalKey<ScaffoldState> _pageScaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _description = TextEditingController(
    //     text: widget.note != null ? widget.note.description : "");
    _description = TextEditingController();
    _eventDate = DateTime.now();
    processing = false;
  }

  predictEmotionAndAddDiary() async {
    setState(() {
      processing = true;
    });

    //Initialize value
    diary = _description.text;
    selectedDate = DateFormat('yMMMMd').format(_eventDate);
    print("test: " + diary);

    //prediction
    var body = {
      'sentance': diary
    };
    var resp = await predictEmotion(body);

    // since prediction can take a long time, user may have already close the screen
    // so we have to verified that the screen is still "mounted" (not closed by user)
    // before continuing
    if (this.mounted) {
      setState(() {
        processing = false;
      });

      // if there's no error (prediction result retrieved successfully)
      if (resp != null) {
        //route to summary page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
              SummaryDiary(
                selectedDate: selectedDate,
                diary: diary,
                emotion: resp,
                date: _eventDate,
              ),
          ),
        );
      }
      else {
        _pageScaffold.currentState.showSnackBar(
          SnackBar(
            content: Text("Cannot get prediction result from Server"),
            action: SnackBarAction(
              label: "TRY AGAIN", 
              onPressed: () {
                predictEmotionAndAddDiary();
              },
            ),
          )
        );
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _pageScaffold,
      body: Container(
        color: Color(0xff27496d),
        child: SafeArea(
          child: Container(
            // child: ListView(
            //   children: <Widget>[
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.mic,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: ( // prevent clicking this button when predicting result
                            !processing ?
                            () => Navigator.pushNamed(context, AddVoiceScreen.routeName)
                            : null
                          )
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 35,
                    left: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Add My Diary",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 3,
                      right: 3,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: isDrawerOpen
                            ? BorderRadius.circular(40)
                            : BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 30,
                          right: 30,
                          bottom: 10,
                        ),
                        child: ListView(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
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
                                          firstDate:
                                              DateTime(_eventDate.year - 5),
                                          lastDate:
                                              DateTime(_eventDate.year + 5),
                                        );
                                        if (picked != null) {
                                          setState(
                                            () {
                                              _eventDate = picked;
                                              // print("object");
                                              print(widget.note);
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Diary",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _description,
                                      enabled: !processing,   // prevent editing diary message when predicting result
                                      minLines: 6,
                                      maxLines: 10,
                                      validator: (value) => (value.isEmpty)
                                          ? "Please Enter Diary"
                                          : null,
                                      style: style,
                                      decoration: InputDecoration(
                                        labelText: "Please Enter Diary",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 50,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      (
                                        processing ?
                                        OutlineButton(
                                          onPressed: null,
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              valueColor: AlwaysStoppedAnimation(Color(0xffecb45b)),
                                            )
                                          )
                                        )
                                        :
                                        RaisedButton(
                                          color: Color(0xffecb45b),
                                          onPressed: !processing ? predictEmotionAndAddDiary : null,

                                          child: Container(
                                            width: 55,
                                            // color: Color(0xffecb45b),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text("Next "),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.black,
                                                  size: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        )

                                      ),
                                    ],
                                  ),
                                ),
                                // processing
                                //     ? Center(child: CircularProgressIndicator())
                                //     : Padding(
                                //         padding: EdgeInsets.symmetric(
                                //           horizontal: 40,
                                //         ),
                                //         child: Material(
                                //           elevation: 5.0,
                                //           borderRadius: BorderRadius.circular(10.0),
                                //           color: Color(0xFFecb45b),
                                //           child: MaterialButton(
                                //             onPressed: () async {
                                //               if (_formKey.currentState
                                //                   .validate()) {
                                //                 setState(
                                //                   () {
                                //                     processing = true;
                                //                   },
                                //                 );
                                //                 if (widget.note != null) {
                                //                   await eventDBS.updateItem(
                                //                     EventModel(
                                //                       id: widget.note.id,
                                //                       title: _title.text,
                                //                       description:
                                //                           _description.text,
                                //                       eventDate:
                                //                           widget.note.eventDate,
                                //                     ),
                                //                   );
                                //                 } else {
                                //                   await eventDBS.createItem(
                                //                     EventModel(
                                //                       title: _title.text,
                                //                       description:
                                //                           _description.text,
                                //                       eventDate: _eventDate,
                                //                     ),
                                //                   );
                                //                 }
                                //                 Navigator.pop(context);
                                //                 setState(
                                //                   () {
                                //                     processing = false;
                                //                   },
                                //                 );
                                //               }
                                //             },
                                //             child: Text(
                                //               "Save",
                                //               style: style.copyWith(
                                //                 color: Colors.black,
                                //                 fontWeight: FontWeight.bold,
                                //                 fontSize: 20,
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                // TextFormField(
                                //   cursorColor: Colors.brown,
                                //   controller: _title,
                                //   validator: (value) =>
                                //       (value.isEmpty) ? "Please Enter title" : null,
                                //   style: style,
                                //   decoration: InputDecoration(
                                //     labelText: "Title",
                                //     // filled: true,
                                //     // fillColor: Colors.white,
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //   ],
                      // ),
                      // child: Container(
                      //   child: ListView(
                      //     children: <Widget>[
                      //       Padding(
                      //         padding: const EdgeInsets.only(
                      //           top: 30,
                      //           left: 30,
                      //           right: 30,
                      //           bottom: 10,
                      //         ),
                      //         child: Container(
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: <Widget>[
                      //               Text(
                      //                 "Date",
                      //                 style: TextStyle(
                      //                   fontWeight: FontWeight.w500,
                      //                   fontSize: 20,
                      //                   color: Colors.black,
                      //                 ),
                      //               ),
                      //               TextFormField(
                      //                 cursorColor: Colors.brown,
                      //                 controller: _title,
                      //                 validator: (value) => (value.isEmpty)
                      //                     ? "Please Enter title"
                      //                     : null,
                      //                 style: style,
                      //                 decoration: InputDecoration(
                      //                   labelText: "Title",
                      //                   // filled: true,
                      //                   // fillColor: Colors.white,
                      //                   border: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.circular(10),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return Stack(
    //   children: <Widget>[
    //     Container(
    //       // child: BackGround(),
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
    //                       Navigator.pop(context);
    //                     },
    //                   ),
    //                   Row(
    //                     children: <Widget>[
    //                       IconButton(
    //                         icon: Icon(
    //                           Icons.mic,
    //                           color: Colors.white,
    //                           size: 40,
    //                         ),
    //                         onPressed: () => Navigator.pushNamed(
    //                             context, AddVoiceScreen.routeName),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 10,
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
    //                       height: 450,
    //                       margin: EdgeInsets.symmetric(
    //                         horizontal: 20,
    //                       ),
    //                       decoration: BoxDecoration(
    //                         color: Color(0xfff5f2ed),
    //                         borderRadius: BorderRadius.circular(20),
    //                       ),
    //                       padding: EdgeInsets.all(30),
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
    //                               // filled: true,
    //                               // fillColor: Colors.white,
    //                               border: OutlineInputBorder(
    //                                 borderRadius: BorderRadius.circular(10),
    //                               ),
    //                             ),
    //                           ),
    //                           SizedBox(height: 20),
    //                           TextFormField(
    //                             controller: _description,
    //                             minLines: 3,
    //                             maxLines: 10,
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
    //                             height: 30,
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
    //                                     // print("object");
    //                                     print(widget.note);
    //                                   },
    //                                 );
    //                               }
    //                             },
    //                           ),
    //                           SizedBox(
    //                             height: 20,
    //                           ),
    //                           processing
    //                               ? Center(child: CircularProgressIndicator())
    //                               : Padding(
    //                                   padding: EdgeInsets.symmetric(
    //                                     horizontal: 40,
    //                                   ),
    //                                   child: Material(
    //                                     elevation: 5.0,
    //                                     borderRadius:
    //                                         BorderRadius.circular(10.0),
    //                                     color: Color(0xFFecb45b),
    //                                     child: MaterialButton(
    //                                       onPressed: () async {
    //                                         if (_formKey.currentState
    //                                             .validate()) {
    //                                           setState(
    //                                             () {
    //                                               processing = true;
    //                                             },
    //                                           );
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
    //                                           setState(
    //                                             () {
    //                                               processing = false;
    //                                             },
    //                                           );
    //                                         }
    //                                       },
    //                                       child: Text(
    //                                         "Save",
    //                                         style: style.copyWith(
    //                                           color: Colors.black,
    //                                           fontWeight: FontWeight.bold,
    //                                           fontSize: 20,
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

  // @override
  // void dispose() {
  //   _title.dispose();
  //   _description.dispose();
  //   super.dispose();
  // }
}
