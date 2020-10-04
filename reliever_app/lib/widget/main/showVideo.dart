
// //import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
//import 'package:video_player_platform_interface/video_player_platform_interface.dart';

class ChewieListItem extends StatefulWidget{
  //ChewieListItem({Key key}) : super(key: key);
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem>{
  //String urlVideo = 'assets/vi1.mp4';
  //String urlVideo = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
  //VideoPlayerController videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState(){
    super.initState();
    //videoPlayerController = VideoPlayerController.asset(urlVideo);
    //videoPlayerController = VideoPlayerController.network(urlVideo);
    
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 3/1.5 ,
      autoInitialize: true,
      //autoPlay: false,
      looping: widget.looping,
      autoPlay: false,
      //looping: true,
      errorBuilder: (context, errorMessage){
        return Center(
          child: Text(errorMessage,
          style: TextStyle(color: Colors.white),
          ),
        );
      }
    );
  }

  // @override
  // void dispose(){
  //   super.dispose();
  //   videoPlayerController.dispose();
  //   _chewieController.dispose();
  //   //super.dispose();
  // }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
  @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    //super.dispose();
  }
}


