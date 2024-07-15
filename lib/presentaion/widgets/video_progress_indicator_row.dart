import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reddit_feature_clone/core/color_manager.dart';
import 'package:reddit_feature_clone/core/spacing.dart';
import 'package:reddit_feature_clone/presentaion/controller/video_player_provider.dart';
import 'package:video_player/video_player.dart';

class VideoProgressIndicatorRow extends StatelessWidget {
  const VideoProgressIndicatorRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<VideoPlayerProvider>(
          builder: (context, value, child) {
            return GestureDetector(
              child: Icon(
                value.controller.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
                size: 30,
                color: Colors.white,
              ),
              onTap: () {
                value.pauseOrPlayVideo();
              },
            );
          },
        ),
        const HorizontalSpace(width: 5),
        Consumer<VideoPlayerProvider>(
          builder: (context, value, child) {
            return Expanded(
              child: VideoProgressIndicator(
                colors: const VideoProgressColors(
                  backgroundColor: Color.fromARGB(131, 66, 66, 66),
                  playedColor: ColorsManager.iconWhiteColor,
                ),
                value.controller,
                allowScrubbing: true,
              ),
            );
          },
        ),
        const HorizontalSpace(width: 5),
        Consumer<VideoPlayerProvider>(
          builder: (context, videoPlayerProvider, child) {
            return Text(
                formatDuration(videoPlayerProvider.controller.value.position),
                style: const TextStyle(
                    color: ColorsManager.textWhiteColor,
                    fontWeight: FontWeight.bold));
          },
        ),
        const HorizontalSpace(width: 5),
        Consumer<VideoPlayerProvider>(
          builder: (context, value, child) {
            return GestureDetector(
                onTap: () {
                  value.toggleVideoSound();
                },
                child: Icon(
                  value.controller.value.volume == 1
                      ? MdiIcons.volumeHigh
                      : MdiIcons.volumeMute,
                  size: 30,
                  color: ColorsManager.iconWhiteColor,
                ));
          },
        ),
      ],
    );
  }
}

String formatDuration(Duration duration) {
  return '''${duration.inMinutes.toString().padLeft(2, '0')}:${duration.inSeconds.toString().padLeft(2, '0')}''';
}
