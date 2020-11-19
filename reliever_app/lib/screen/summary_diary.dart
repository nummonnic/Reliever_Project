import 'package:flutter/material.dart';

import '../screen/diary/diary_screen.dart';
import '../model/event.dart';
import '../database/event_firestore_service.dart';

class SummaryDiary extends StatefulWidget {
  static const routeName = '/predict_emotion-page';
  final String selectedDate;
  final String diary;
  final String emotion;
  final DateTime date;
  SummaryDiary(
      {Key key, this.diary, this.selectedDate, this.emotion, this.date})
      : super(key: key);

  @override
  _SummaryDiaryState createState() =>
      _SummaryDiaryState(diary, selectedDate, emotion, date);
}

class _SummaryDiaryState extends State<SummaryDiary> {
  String selectedDate;
  String diary;
  String emotion;
  DateTime date;
  bool processing;

  @override
  void initState() {
    super.initState();
    processing = false;
  }

  _SummaryDiaryState(this.diary, this.selectedDate, this.emotion, this.date);

  @override
  Widget build(BuildContext context) {
    //variable
    //Date => selectedDate
    //Diary => diary
    //emotion => emotion

    return Scaffold(
      body: Container(
        color: Color(0xff27496d),
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "My Diary",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 30,
                    right: 30,
                    bottom: 50,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                        bottom: 20,
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Date:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  selectedDate != null ? selectedDate : "-",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Diary:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  diary != null ? diary : "-",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Emotion: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  emotion != null ? emotion : "-",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 60,
                              ),
                              child: Container(
                                // color: Colors.black,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30,
                                      right: 30,
                                    ),
                                    child: RaisedButton(
                                      color: Color(0xffecb45b),
                                      onPressed: () {},
                                      child: processing
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : Container(
                                              height: 60,
                                              width: 150,
                                              // color: Color(0xff27496d),
                                              child: MaterialButton(
                                                onPressed: () async {
                                                  setState(
                                                    () {
                                                      processing = true;
                                                    },
                                                  );

                                                  await eventDBS.createItem(
                                                    EventModel(
                                                      emotion: emotion,
                                                      description: diary,
                                                      eventDate: date,
                                                    ),
                                                  );

                                                  Navigator.pushNamed(context,
                                                      DiaryScreen.routeName);
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
                                      // child: Container(
                                      //   width: 80,
                                      //   // color: Color(0xffecb45b),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.center,
                                      //     children: <Widget>[
                                      //       Text("Save Diary"),

                                      //     ],
                                      //   ),
                                      // ),
                                    ),
                                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}
