import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
//import '../widget/clipDialog.dart';
import '../widget/showVideo.dart';
import '../widget/rateDialog.dart';

class ActivityClip extends StatefulWidget {
  ActivityClip({Key key, this.title, this.rate}) : super(key: key);

  final String title;
  final String rate;

  @override
  _ActivityState createState() => _ActivityState(rate);
}

class _ActivityState extends State<ActivityClip> {
  String rate;
  _ActivityState(this.rate);
  final List<String> numbers = [
    'vi3',
    'meditation',
    'vi1',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.75, right: MediaQuery.of(context).size.width * 0.01, left: MediaQuery.of(context).size.width * 0.01),
        //margin: const EdgeInsets.only(right: 10, left: 10, top: 300),
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              return Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 10, bottom: 20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    // color: Color(0xff),
                    color: Colors.black,
                    child: Container(
                      child: Center(
                          child: Text(
                        numbers[index].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      )),
                    ),
                    onPressed: () {
                      //_showMaterialDialog();
                      //_showMaterialDialog() {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                title: new Text("Video Clip"),
                                content: Container(
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.27,
                                    // width:
                                    //     MediaQuery.of(context).size.width * 0.8,
                                    // child: ChewieListItem(
                                    //   videoPlayerController:
                                    //       VideoPlayerController.asset(
                                    //           'assets/videos/' +
                                    //               numbers[index].toString() +
                                    //               '.mp4'),
                                    child: ChewieListItem(
                                      videoPlayerController:
                                          VideoPlayerController.asset(
                                              'assets/videos/meditation.mp4'),
                                    )),
                                //Container(height: 200, width: 500, child: VideoApp()),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Rate Video'),
                                    onPressed: () {
                                      _showRateDialog();
                                      //RateVideo();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ));
                    },
                  ));
            }));
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

  _showRateDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Rate Dialog"),
              content: RateVideo(),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
