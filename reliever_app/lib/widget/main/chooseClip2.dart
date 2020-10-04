import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
//import '../widget/clipDialog.dart';
import './showVideo.dart';
// import '../widget/rateDialog.dart';
import '../../model/feedback.dart';
import '../../database/feedback_firestore_service.dart';
import '../../screen/main/result_screen.dart';
//import './youtubeVideo.dart';
import './showYoutube.dart';

class ActivityClip2 extends StatefulWidget {
  final String url;
  final String title;
  final FeedbackModel rateNote;
  ActivityClip2({Key key, this.title, this.rateNote, this.url})
      : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<ActivityClip2> {
  String url;
  _ActivityState({this.url});
  //final List<String> numbers = ['meditation', 'vi1', 'vi3'];
  final List<String> numbers = ['Breathing', 'Meditation', 'Pray'];
  final List<String> urlList = [
    'https://www.youtube.com/watch?v=PmBYdfv5RSk',
    'https://www.youtube.com/watch?v=inpok4MKVLM',
    'https://www.youtube.com/watch?v=SiZWLQozD4Y'
  ];
  final List<String> pic = [
    // 'assets/images/LG5.png',
    // 'assets/images/stress.png',
    // 'assets/images/stress.png',
    // 'assets/images/normal.png',
    // 'assets/images/happy.png',
    // 'assets/images/stress.png',
    // 'assets/images/normal.png',
    // 'assets/images/happy.png'

    'Calm',
    // 'Happy',
    'Surprised',
    'Funny',
    'Sleepy'
  ];
  String _rate = "";
  // DateTime _feedbackDate;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool processing;
  DateTime _date;
  // bool isSelected;
  List<bool> isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _date = DateTime.now();
    processing = false;
    isSelected = [
      false,
      false,
      false,
      false,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: 200,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                color: Color(0xffc98a3c),
                child: Container(
                  child: Center(
                    child: Text(
                      numbers[index].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
                onPressed: () {
                  url = urlList[index].toString();
                  //  Navigator.of(context).pushNamed(YoutubeVideo.routeName);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YoutubeVideo(
                              url: url,
                            )),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => YoutubeVideo(),
                  //   )
                  // );
                  //print(urlList[index].toString());

                  // showDialog(
                  //   context: context,
                  //   builder: (_) => new AlertDialog(
                  //     content: Container(
                  //       // color: Colors.orange,
                  //       height: 500,
                  //       child: Padding(
                  //         padding: EdgeInsets.only(left: 5),
                  //         child: Column(
                  //           children: <Widget>[
                  //             Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: <Widget>[
                  //                 Text("Video Clip"),
                  //                 IconButton(
                  //                   icon: Icon(
                  //                     Icons.close,
                  //                     color: Colors.black,
                  //                   ),
                  //                   onPressed: () {
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                 ),
                  //               ],
                  //             ),
                  //             YoutubeVideo(),
                  //             // ChewieListItem(
                  //             //   videoPlayerController:
                  //             //       VideoPlayerController.asset(
                  //             //           //'assets/videos/meditation.mp4'),
                  //             //           'assets/videos/Breathing.mp4'),
                  //             // ),
                  //             FlatButton(
                  //               onPressed: () {
                  //                 _showRatingDialog();
                  //               },
                  //               child: Padding(
                  //                 padding: EdgeInsets.only(top: 5),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.end,
                  //                   children: <Widget>[
                  //                     Text(
                  //                       'Next',
                  //                       style: TextStyle(
                  //                         color: Colors.black,
                  //                         fontSize: 15.0,
                  //                       ),
                  //                     ),
                  //                     SizedBox(width: 5.0),
                  //                     Icon(
                  //                       Icons.arrow_forward,
                  //                       color: Colors.black,
                  //                       size: 20.0,
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
          );
        },
      ),
    );
    // return Container(
    //   //margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.75, right: MediaQuery.of(context).size.width * 0.01, left: MediaQuery.of(context).size.width * 0.01),
    //   //margin: const EdgeInsets.only(right: 10, left: 10, top: 300),
    //   height: MediaQuery.of(context).size.height * 0.3,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: numbers.length,
    //     itemBuilder: (context, index) {
    //       return Container(
    //         width: 200,
    //         margin: const EdgeInsets.only(right: 10, bottom: 20),
    //         child: RaisedButton(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: new BorderRadius.circular(18.0),
    //           ),
    //           color: Color(0xff27496d),
    //           child: Container(
    //             child: Center(
    //                 child: Text(
    //               numbers[index].toString(),
    //               style: TextStyle(color: Colors.white, fontSize: 30.0),
    //             )),
    //           ),
    //           onPressed: () {
    //             // _showMaterialDialog();

    //             showDialog(
    //               context: context,
    //               builder: (_) => new AlertDialog(
    //                 title: new Text("Video Clip"),
    //                 content: Container(
    //                     height: MediaQuery.of(context).size.height * 0.27,
    //                     width: MediaQuery.of(context).size.width * 0.8,
    //                     // child: ChewieListItem(
    //                     //   videoPlayerController:
    //                     //       VideoPlayerController.asset(
    //                     //           'assets/videos/' +
    //                     //               numbers[index].toString() +
    //                     //               '.mp4'),
    //                     child: ChewieListItem(
    //                       videoPlayerController: VideoPlayerController.asset(
    //                           'assets/videos/meditation.mp4'),
    //                     )),
    //                 //Container(height: 200, width: 500, child: VideoApp()),
    //                 actions: <Widget>[
    //                   FlatButton(
    //                     child: Text('Rate Video'),
    //                     onPressed: () {
    //                       _showRateDialog();
    //                       //RateVideo();
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text('Close'),
    //                     onPressed: () {
    //                       Navigator.of(context).pop();
    //                     },
    //                   )
    //                 ],
    //               ),
    //             );
    //           },
    //         ),
    //       );
    //     },
    //   ),
    // );
  }

  _showRatingDialog() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        content: Container(
          key: _key,
          height: 250,
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Rate Video"),
              Container(
                key: _formKey,
                height: 100,
                // color: Colors.brown,
                // child: ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: pic.length,
                //   itemBuilder: (context, index) {
                //     return Container(
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: <Widget> [
                //           Toggl
                //         ],
                //       ),
                //     );
                //   },
                // ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pic.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              print(pic[index]);
                              _rate = pic[index];
                              isSelected[index] = true;
                              print(isSelected[index]);
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              color: isSelected[index]
                                  ? Colors.amber
                                  : Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/' +
                                        pic[index].toString() +
                                        '.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(pic[index].toString())
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      setState(
                        () {
                          processing = true;
                          if (_rate == "") {
                            _rate = "Unknown";
                          }
                          // _date = DateTime.now();
                          // _time =
                          //     new DateFormat.Hms().format(new DateTime.now());
                          // _month =
                          //     new DateFormat.MMMM().format(new DateTime.now());
                        },
                      );
                      await rateDBS.createItem(
                        FeedbackModel(
                          rate: _rate,
                          rateDate: _date,

                          // rateTime: _time,
                          // rateMonth: _month,
                          // title: _titleVoice,
                          // description: _descriptVoice,
                          // eventDate: _eventDate,
                        ),
                      );
                      Navigator.pushNamed(context, ResultScreen.route);
                    },
                    child: Text(
                      "Save Feedback",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _showMaterialDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (_) => new AlertDialog(
  //             title: new Text("Video Clip"),
  //             content:
  //                 Container(height: MediaQuery.of(context).size.height * 0.27, width: MediaQuery.of(context).size.width * 0.8,
  //                 child: ChewieListItem(videoPlayerController: VideoPlayerController.asset('assets/vi1.mp4'),)),
  //                 //Container(height: 200, width: 500, child: VideoApp()),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text('Rate Video'),
  //                 onPressed: () {
  //                   _showRateDialog();
  //                   //RateVideo();
  //                 },
  //               ),
  //               FlatButton(
  //                 child: Text('Close'),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               )
  //             ],
  //           ));
  // }

  feedbackVideo() {
    Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pic.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                print(pic[index]);

                // print(new DateFormat.yMMMd().format(new DateTime.now()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/' + pic[index].toString() + '.png',
                      height: 50,
                      width: 50,
                    ),
                    Text(pic[index].toString())
                  ],
                ),
              ),
            ),
            //    child: InkWell(
            //           onTap: () {
            //           },

            //            //I am the clickable child
            //   //          child: Stack(
            //   // children: <Widget> [
            //         child:Image.asset('assets/images/'+pic[index].toString()+'.png', height: 70, width: 70,),
            //         //Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 20)),
            //       //Text(pic[index].toString())
            //   //])
            // )
          );
        },
      ),
    );
  }

  // _showRateDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (_) => new AlertDialog(
  //       title: new Text("Rate Dialog"),
  //       content: feedbackVideo(),
  //       actions: <Widget>[
  //         FlatButton(
  //           child: Text('Ok'),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
}
