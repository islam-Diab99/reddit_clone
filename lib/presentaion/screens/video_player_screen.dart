import 'package:flutter/material.dart';
import 'package:reddit_feature_clone/core/spacing.dart';
import 'package:reddit_feature_clone/presentaion/widgets/custom_bottom_sheet.dart';
import 'package:reddit_feature_clone/presentaion/widgets/header_widget.dart';
import 'package:reddit_feature_clone/presentaion/widgets/size_adaptable_video_player.dart';
import 'package:reddit_feature_clone/presentaion/widgets/video_progress_indicator_row.dart';
import 'package:reddit_feature_clone/presentaion/widgets/video_reactions_row.dart';
import 'package:reddit_feature_clone/presentaion/widgets/video_title_widget.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: BuildVideoPlayerScreenBody(),
    );
  }
}

class BuildVideoPlayerScreenBody extends StatefulWidget {
  const BuildVideoPlayerScreenBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuildVideoPlayerScreenBodyState createState() =>
      _BuildVideoPlayerScreenBodyState();
}

class _BuildVideoPlayerScreenBodyState
    extends State<BuildVideoPlayerScreenBody> {
  bool _isBottomSheetOpen = false;

  void _showCustomBottomSheet(BuildContext context) {
    setState(() {
      _isBottomSheetOpen = true;
    });

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      elevation: 0,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy < -6) {
              Navigator.of(context).pop();
            }
          },
          child: const CustomBottomSheet(),
        );
      },
    ).whenComplete(() {
      setState(() {
        _isBottomSheetOpen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (dragDetails) {
        if (dragDetails.primaryDelta! < 0 && !_isBottomSheetOpen) {
          _showCustomBottomSheet(context);
        }
      },
      child: const Stack(
        children: [
          SizeAdaptableVideoPlayer(),
          Padding(
            padding: EdgeInsets.only(top: 52, bottom: 40, right: 10, left: 10),
            child: Column(
              children: [
                HeaderWidget(),
                Spacer(),
                VideoTitleWidget(),
               VerticalSpace(height: 20),
                VideoProgressIndicatorRow(),
                VerticalSpace(height: 20),
                VideoReActionsRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
