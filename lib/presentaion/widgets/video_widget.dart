import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_feature_clone/presentaion/controller/video_player_provider.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<VideoPlayerProvider>(
       
        builder: (_, provider,__) {
          return AspectRatio(
            aspectRatio: provider.controller.value.aspectRatio,
            child: VideoPlayer(provider.controller,),
          );
        },
      ),
    );
  }
}
