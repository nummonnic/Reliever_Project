import 'package:flutter/material.dart';
//import '../widget/clipDialog.dart';
import '../widget/showVideo.dart';
import '../widget/rateDialog.dart';

class ActivityClip extends StatefulWidget {
  ActivityClip({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<ActivityClip> {
  final List<String> numbers = [
    'Soft Music',
    'Meditation',
    'Pray',
    'Breathing',
    'Relex'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10, left: 10, top: 350),
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              return Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    color: Colors.brown,
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
              title: new Text("Video Dialog"),
              content:
                  Container(height: 200, width: 400, child: ChewieListItem()),
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
