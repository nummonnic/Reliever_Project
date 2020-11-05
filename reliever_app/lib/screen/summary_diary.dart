import 'package:flutter/material.dart';

class SummaryDiary extends StatefulWidget {
  static const routeName = '/predict_emotion-page';
  final String selectedDate;
  final String diary;
  final String emotion;
  SummaryDiary({Key key, this.diary, this.selectedDate, this.emotion})
      : super(key: key);

  @override
  _SummaryDiaryState createState() =>
      _SummaryDiaryState(diary, selectedDate, emotion);
}

class _SummaryDiaryState extends State<SummaryDiary> {
  String selectedDate;
  String diary;
  String emotion;

  _SummaryDiaryState(this.diary, this.selectedDate, this.emotion);

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
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 30,
                //   ),
                //   child: Text(
                //     "My Diary",
                //     style: TextStyle(
                //       fontWeight: FontWeight.w900,
                //       fontSize: 30,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     // color: Color(0xff27496d),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Container(
    //           height: MediaQuery.of(context).size.height / 2,
    //           decoration: BoxDecoration(
    //             color: Color(0xff27496d),
    //             borderRadius: BorderRadius.only(
    //               bottomLeft: Radius.circular(40),
    //               bottomRight: Radius.circular(40),
    //             ),
    //           ),
    //           child: SafeArea(
    //             child: Container(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: <Widget>[
    //                       Row(
    //                         children: <Widget>[
    //                           IconButton(
    //                             icon: Icon(
    //                               Icons.arrow_back_ios,
    //                               color: Colors.white,
    //                               size: 20,
    //                             ),
    //                             onPressed: () {
    //                               Navigator.pop(context);
    //                             },
    //                           ),
    //                         ],
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.only(
    //                           left: 30,
    //                         ),
    //                         child: Text(
    //                           "My Diary",
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.w900,
    //                             fontSize: 30,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(
    //                       left: 60,
    //                     ),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: <Widget>[
    //                         Text(
    //                           "Date",
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.w700,
    //                             fontSize: 20,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 10,
    //                         ),
    //                         Text(
    //                           selectedDate,
    //                           // "19 January 2020",
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.w300,
    //                             fontSize: 17,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(
    //                       left: 60,
    //                       bottom: 50,
    //                     ),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: <Widget>[
    //                         Text(
    //                           "Diary",
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.w700,
    //                             fontSize: 20,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 10,
    //                         ),
    //                         diary != ""
    //                             ? Text(
    //                                 // "long sentence",
    //                                 diary,
    //                                 style: TextStyle(
    //                                   fontWeight: FontWeight.w300,
    //                                   fontSize: 17,
    //                                   color: Colors.white,
    //                                 ),
    //                               )
    //                             : Text(
    //                                 "Please Enter Diary",
    //                                 // diary,
    //                                 style: TextStyle(
    //                                   fontWeight: FontWeight.w300,
    //                                   fontSize: 17,
    //                                   color: Colors.white,
    //                                 ),
    //                               )
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(20.0),
    //           child: Container(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Text(
    //                   "Your emotion: ",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.w900,
    //                     fontSize: 25,
    //                     // color: Colors.white,
    //                   ),
    //                 ),
    //                 Text(
    //                   emotion,
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.w900,
    //                     fontSize: 25,
    //                     // color: Colors.white,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 20,
    //                 ),
    //                 Center(
    //                   child: Container(
    //                     height: 100,
    //                     width: 100,
    //                     color: Colors.amber,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
