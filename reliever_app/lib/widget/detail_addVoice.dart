import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:intl/intl.dart';

import '../screen/diary/result_voice.dart';
import '../model/predict_emotion.dart';
import '../screen/summary_diary.dart';

class SpeechScreen extends StatefulWidget {
  SpeechScreen({Key key}) : super(key: key);

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'happy': HighlightedWord(
      onTap: () => print('happy'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bad': HighlightedWord(
      onTap: () => print('bad'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;
  String result;
  String diary;
  DateTime _eventDate;
  String selectedDate = "";

  @override
  void initState() {
    // TODO: implement initState
    _speech = stt.SpeechToText();
    _eventDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Colors.brown,
        endRadius: 60.0,
        duration: Duration(milliseconds: 2000),
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: () {
            _listen();
          },
          backgroundColor: Color(0xffe6d4c0),
          child: Icon(
            _isListening ? Icons.mic : Icons.mic_none,
            color: Colors.brown,
          ),
        ),
      ),
      backgroundColor: Color(0xff27496d),
      body: SafeArea(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      //Initialize value
                      diary = _text;
                      selectedDate = DateFormat('yMMMMd').format(_eventDate);
                      print(_eventDate);

                      //prediction
                      var body = {'sentance': diary};
                      print(body);
                      var resp = await predictEmotion(body);

                      //route to summary page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SummaryDiary(
                            selectedDate: selectedDate,
                            diary: diary,
                            emotion: resp,
                            date: _eventDate,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: 20,
                              right: 20,
                            ),
                            child: Column(
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // color: Colors.white,
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SingleChildScrollView(
                                  reverse: true,
                                  child: Container(
                                    child: TextHighlight(
                                      text: _text,
                                      words: _highlights,
                                      textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   floatingActionButton: AvatarGlow(
    //     animate: _isListening,
    //     glowColor: Colors.brown,
    //     endRadius: 60.0,
    //     duration: Duration(milliseconds: 2000),
    //     repeatPauseDuration: Duration(milliseconds: 100),
    //     repeat: true,
    //     child: FloatingActionButton(
    //       onPressed: () {
    //         _listen();
    //       },
    //       backgroundColor: Color(0xffe6d4c0),
    //       child: Icon(
    //         _isListening ? Icons.mic : Icons.mic_none,
    //         color: Colors.brown,
    //       ),
    //     ),
    //   ),
    //   backgroundColor: Color(0xff27496d),
    //   body: Form(
    //     child: Container(
    //       child: ListView(
    //         children: <Widget>[
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               IconButton(
    //                 icon: Icon(
    //                   Icons.arrow_back_ios,
    //                   color: Colors.white,
    //                 ),
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //               ),
    //               FlatButton(
    //                 onPressed: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) =>
    //                           ShowDiaryVoice(speechDiary: _text),
    //                     ),
    //                   );
    //                 },
    //                 child: Icon(
    //                   Icons.arrow_forward_ios,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(20.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Text(
    //                   "      Hello there, \n          Add My Diary",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.w900,
    //                     fontSize: 30,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 30,
    //                 ),
    //                 Container(
    //                   // color: Colors.white,
    //                   height: 500,
    //                   width: MediaQuery.of(context).size.width,
    //                   decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(20)),
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(20.0),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: <Widget>[
    //                         Padding(
    //                           padding: const EdgeInsets.all(10.0),
    //                           child: SingleChildScrollView(
    //                             reverse: true,
    //                             child: Container(
    //                               child: TextHighlight(
    //                                 text: _text,
    //                                 words: _highlights,
    //                                 textStyle: const TextStyle(
    //                                   fontSize: 20,
    //                                   color: Colors.black,
    //                                   fontWeight: FontWeight.w400,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    // //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    // Scaffold(
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   floatingActionButton: AvatarGlow(
    //     animate: _isListening,
    //     glowColor: Colors.brown,
    //     endRadius: 60.0,
    //     duration: const Duration(milliseconds: 2000),
    //     repeatPauseDuration: const Duration(milliseconds: 100),
    //     repeat: true,
    //     child: FloatingActionButton(
    //       onPressed: () {
    //         _listen();
    //         // print()
    //       },
    //       backgroundColor: Color(0xff27496d),
    //       child: Icon(_isListening ? Icons.mic : Icons.mic_none),
    //     ),
    //   ),
    //   backgroundColor: Colors.white,
    //   body: Form(
    //     child: Container(
    //       child: ListView(
    //         children: <Widget>[
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               IconButton(
    //                 icon: Icon(
    //                   Icons.arrow_back_ios,
    //                   color: Colors.black,
    //                 ),
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //               ),
    //               FlatButton(
    //                 onPressed: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) =>
    //                           ShowDiaryVoice(speechDiary: _text),
    //                     ),
    //                   );
    //                 },

    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   mainAxisSize: MainAxisSize.min,
    //                   children: <Widget>[
    //                     // Text(
    //                     //   'Next',
    //                     //   style: TextStyle(
    //                     //     color: Colors.black,
    //                     //     fontSize: 18.0,
    //                     //   ),
    //                     // ),
    //                     SizedBox(width: 10.0),
    //                     Icon(
    //                       Icons.arrow_forward,
    //                       color: Colors.black,
    //                       size: 30.0,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Padding(
    //             padding: EdgeInsets.all(20),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Text(
    //                   "Diary: ",
    //                   style: TextStyle(color: Colors.black, fontSize: 30),
    //                 ),
    //                 SingleChildScrollView(
    //                   reverse: true,
    //                   child: Container(
    //                     padding:
    //                         const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
    //                     child: TextHighlight(
    //                       text: _text,
    //                       words: _highlights,
    //                       textStyle: const TextStyle(
    //                         fontSize: 20,
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.w400,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            result = _text;
            print(_text);
            print("Result: " + result);
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      result = _text;
      print("Result_test: " + result);
      _speech.stop();
    }
  }
}
