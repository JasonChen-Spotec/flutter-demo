import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class YybaVideo extends StatefulWidget {
  @override
  _YybaVideoState createState() => _YybaVideoState();
}

class _YybaVideoState extends State<YybaVideo> {
  final videoPlayerController = VideoPlayerController.network(
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');

  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final playerWidget = Chewie(
      controller: chewieController,
    );
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: playerWidget,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
}
