
// //import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
//import 'package:video_player_platform_interface/video_player_platform_interface.dart';

class ChewieListItem extends StatefulWidget{
  //ChewieListItem({Key key}) : super(key: key);
  //final VideoPlayerController videoPlayerController;
  //final bool looping;

  // ChewieListItem({
  //   @required this.videoPlayerController,
  //   this.looping,
  //   Key key,
  // }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem>{
  String urlVideo = 'assets/vi1.mp4';
  VideoPlayerController videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState(){
    super.initState();
    videoPlayerController = VideoPlayerController.asset(urlVideo);
    
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoInitialize: true,
      //autoPlay: false,
      //looping: widget.looping,
      autoPlay: true,
      looping: true,
      // errorBuilder: (context, errorMessage){
      //   return Center(
      //     child: Text(errorMessage,
      //     style: TextStyle(color: Colors.white),
      //     ),
      //   );
      // }
    );
  }

  @override
  void dispose(){
    super.dispose();
    videoPlayerController.dispose();
    _chewieController.dispose();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}


// class VideoApp extends StatefulWidget {
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(
//         'assets/vi3.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.initialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }