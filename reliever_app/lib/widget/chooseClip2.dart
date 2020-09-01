import 'package:flutter/material.dart';
//import '../widget/clipDialog.dart';
import '../widget/showVideo.dart';
import '../widget/rateDialog.dart';

class ActivityClip2 extends StatefulWidget {
  ActivityClip2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<ActivityClip2> {
  final List<String> numbers = [
    'Meditation',
    'Pray',
    'Breathing',
    'Relex'
    'Soft Music',
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
                    color: Color(0xff27496d),
                    child: Container(
                      child: Center(
                          child: Text(
                        numbers[index].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      )),
                    ),
                    onPressed: () {
                      _showMaterialDialog();
                    },
                  ));
            }));
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Video Clip"),
              content:
                  Container(height: MediaQuery.of(context).size.height * 0.27, width: MediaQuery.of(context).size.width * 0.8, child: ChewieListItem()),
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
            ));
  }
}
