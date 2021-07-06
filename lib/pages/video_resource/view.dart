import 'package:flutter/material.dart';
import 'package:yyba_app/widgets/video_player/view.dart';

class VideoResource extends StatefulWidget {
  const VideoResource({Key? key}) : super(key: key);

  @override
  _VideoResourceState createState() => _VideoResourceState();
}

class _VideoResourceState extends State<VideoResource> {
  @override
  Widget build(BuildContext context) {
    return YybaVideo();
  }
}
