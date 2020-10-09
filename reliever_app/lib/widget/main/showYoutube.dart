import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// class ShowYoutube extends StatelessWidget {
//   //static const routeName = '/show_video';
// @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: YoutubeVideo(),
//     );
//   }
// }

class YoutubeVideo extends StatefulWidget{
  static const routeName = '/show_video';
  final String url;
  YoutubeVideo({Key key, this.url}) : super(key: key);

  // ChewieListItem({
  //   @required this.videoPlayerController,
  //   this.looping,
  //   Key key,
  // }) : super(key: key);

  @override
  _YoutubeVideoState createState() => _YoutubeVideoState(url);
}
class _YoutubeVideoState extends State<YoutubeVideo>{
  String url;
  _YoutubeVideoState(this.url);
  //String videoUrl = url;


  YoutubePlayerController _controller;

   @override
  void initState(){
    _controller = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(url));
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    // return Scaffold(
    //   body: Text("data: " + widget.url),
    // );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Color(0xff27496d),
    //     title: Text('Activity Video'),
    //   ),
    //   body: Container(
    //     child: Center(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: <Widget>[
    //           YoutubePlayer(controller: _controller)
    //         ]
    //       )
    //     )
    //     )
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: YoutubePlayer(controller: _controller),
    );
  }
}