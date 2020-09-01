import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../model/event.dart';
import '../database/event_firestore_service.dart';
import '../screen/diary_screen.dart';

class ShowDiaryVoice extends StatefulWidget {
  final String speechDiary;

  final EventModel note;
  static const routeName = '/detail_voice-page';
  ShowDiaryVoice({Key key, this.note, this.speechDiary}) : super(key: key);

  @override
  _ShowDiaryVoiceState createState() => _ShowDiaryVoiceState(speechDiary);
}

class _ShowDiaryVoiceState extends State<ShowDiaryVoice> {
  String speechDiary;
  _ShowDiaryVoiceState(this.speechDiary);

  List<bool> isSelected;
  String _titleVoice = "";
  String _descriptVoice = "Test";
  List<String> state = ["good", "bad"];

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  DateTime _eventDate;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool processing;

  @override
  void initState() {
    super.initState();
    isSelected = [
      false,
      false,
    ];
    _eventDate = DateTime.now();
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Container(
        key: _formKey,
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 600,
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Description: ",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      speechDiary,
                      // _descriptVoice,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(50),
                        child: Row(
                          children: <Widget>[
                            ToggleButtons(
                              children: <Widget>[
                                Container(
                                  color: isSelected[0]
                                      ? Colors.green
                                      : Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Photo",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: isSelected[0]
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Good",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: isSelected[0]
                                                  ? Colors.white
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: isSelected[1]
                                      ? Colors.red[800]
                                      : Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(40.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Photo",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: isSelected[1]
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Bad",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: isSelected[1]
                                                  ? Colors.white
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              isSelected: isSelected,
                              onPressed: (index) {
                                setState(
                                  () {
                                    for (var i = 0;
                                        i < isSelected.length;
                                        i++) {
                                      if (i == index) {
                                        isSelected[i] = true;
                                        _titleVoice = state[i];
                                        print(_titleVoice);
                                      } else {
                                        isSelected[i] = false;
                                      }
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
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
                            print(_eventDate);
                            print(widget.note);
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        child: processing
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: 80,
                width: double.infinity,
                color: Color(0xff27496d),
                child: MaterialButton(
                  onPressed: () async {
                    setState(
                      () {
                        processing = true;
                        _descriptVoice = speechDiary;
                      },
                    );
                    await eventDBS.createItem(
                      EventModel(
                        title: _titleVoice,
                        description: _descriptVoice,
                        eventDate: _eventDate,
                      ),
                    );
                    Navigator.pushNamed(context, DiaryScreen.routeName);
                    setState(
                      () {
                        processing = false;
                      },
                    );
                  },
                  child: Text(
                    "Save Diary",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
