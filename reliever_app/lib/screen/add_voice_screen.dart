import 'package:flutter/material.dart';

import '../widget/detail_addVoice.dart';

//import '../template/background.dart';

class AddVoiceScreen extends StatelessWidget {
  static const routeName = '/add_voice-page';
  const AddVoiceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SpeechScreen(),
    );
    // MaterialApp(
    //   title: 'Event Voice',
    //   debugShowCheckedModeBanner: false,
    //   home: SpeechScreen(),
    // );
  }
}

// class AddVoiceScreen extends StatelessWidget {
//   static const routeName = '/add_voice-page';
//   const AddVoiceScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Scaffold(
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//           floatingActionButton: AvatarGlow(
//             animate: _isListening,
//             glowColor: Colors.brown,
//             endRadius: 75.0,
//             duration: const Duration(milliseconds: 2000),
//             repeatPauseDuration: const Duration(milliseconds: 100),
//             repeat: true,
//             child: FloatingActionButton(
//               onPressed: () {
//                 _listen();
//               },
//               child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//             ),
//           ),
//           backgroundColor: Colors.white,
//           body: Form(
//             child: Container(
//               child: ListView(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       IconButton(
//                         icon: Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.black,
//                         ),
//                         onPressed: () {
//                           //print('done');
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ],
//                   ),
//                   // SizedBox(
//                   //   height: 10,
//                   // ),
//                   Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           "Title: ",
//                           style: TextStyle(color: Colors.black, fontSize: 30),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextFormField(
//                           cursorColor: Colors.brown,
//                           //controller: _title,
//                           //validator: (value) => (value.isEmpty)
//                           //    ? "Please Enter title"
//                           //    : null,
//                           //style: style,
//                           decoration: InputDecoration(
//                             labelText: "Title",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           "Description: ",
//                           style: TextStyle(color: Colors.black, fontSize: 30),
//                         ),
//                         Container(),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class SpeechScreen extends StatefulWidget {
//   SpeechScreen({Key key}) : super(key: key);

//   @override
//   _SpeechScreenState createState() => _SpeechScreenState();
// }

// class _SpeechScreenState extends State<SpeechScreen> {
//   final Map<String, HighlightedWord> _highlights = {
//     'happy': HighlightedWord(
//       onTap: () => print('happy'),
//       textStyle: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'sad': HighlightedWord(
//       onTap: () => print('sad'),
//       textStyle: const TextStyle(
//         color: Colors.red,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   };
//   stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = 'Press the button and start speaking';
//   double _confidence = 1.0;

//   @override
//   void initState() {
//     // TODO: implement initState
//     _speech = stt.SpeechToText();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: _isListening,
//         glowColor: Colors.brown,
//         endRadius: 75.0,
//         duration: const Duration(milliseconds: 2000),
//         repeatPauseDuration: const Duration(milliseconds: 100),
//         repeat: true,
//         child: FloatingActionButton(
//           onPressed: () {
//             _listen();
//           },
//           child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//           child: TextHighlight(
//             text: _text,
//             words: _highlights,
//             textStyle: const TextStyle(
//               fontSize: 20,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _text = val.recognizedWords;
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               _confidence = val.confidence;
//             }
//           }),
//         );
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }
// }
