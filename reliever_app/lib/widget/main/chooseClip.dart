import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './showVideo.dart';
import './rateDialog.dart';

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
    'Basic Exercise',
    'Nature Sound',
    'Music',
  ];
  // final List<String> numbers = [
  //   'vi3',
  //   'meditation',
  //   'vi1',
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: Colors.black,
              child: Container(
                child: Center(
                    child: Text(
                  numbers[index].toString(),
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                )),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    title: new Text("Video Clip"),
                    content: Container(
                      child: ChewieListItem(
                        videoPlayerController: VideoPlayerController.asset(
                            // 'assets/videos/meditation.mp4'),
                            'assets/videos/Exercise.mp4'),
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Rate Video'),
                        onPressed: () {
                          _showRateDialog();
                        },
                      ),
                      FlatButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

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
      ),
    );
  }
}
