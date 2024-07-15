import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:reddit_feature_clone/core/assets_manager.dart';
import 'package:reddit_feature_clone/core/color_manager.dart';
import 'package:reddit_feature_clone/core/spacing.dart';
import 'package:reddit_feature_clone/presentaion/widgets/animated_icon_widget.dart';

class VideoReActionsRow extends StatefulWidget {
  const VideoReActionsRow({
    super.key,
  });

  @override
  State<VideoReActionsRow> createState() => _VideoReActionsRowState();
}

class _VideoReActionsRowState extends State<VideoReActionsRow> {
  int count = 565;
  bool isUpVotedActive = false;
  bool isDownVotedActive = false;
  upvote() {
    if (isDownVotedActive) {
      isDownVotedActive = false;
      isUpVotedActive = true;
      count = count + 2;
    } else if (isUpVotedActive) {
      isUpVotedActive = !isUpVotedActive;
      count--;
    } else {
      isUpVotedActive = true;
      count++;
    }
  }

  downVote() {
    if (isUpVotedActive) {
      isUpVotedActive = false;
      isDownVotedActive = true;
      count = count - 2;
    } else if (isDownVotedActive) {
      isDownVotedActive = !isDownVotedActive;
      count++;
    } else {
      isDownVotedActive = true;
      count--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HorizontalSpace(width: 20),
        AnimatedIconWidget(
          isActive: isUpVotedActive,
          transitionDirection: TransitionDirection.up,
          defaultIcon: Icon(
            MdiIcons.arrowUpBoldOutline,
            size: 30,
              color: ColorsManager.iconGreyColor,
          ),
          onTransitionIcon:
              Icon(MdiIcons.arrowUpBold, size: 30, color: ColorsManager.upVoteButtonColor),
          onPressed: () {
            setState(upvote);
          },
        ),
        Text(
          count.toString(),
          style: TextStyle(
              color: isUpVotedActive
                  ? ColorsManager.upVoteButtonColor
                  : ColorsManager.textWhiteColor),
        ),
        const HorizontalSpace(width: 15),
        AnimatedIconWidget(
          isActive: isDownVotedActive,
          transitionDirection: TransitionDirection.down,
          defaultIcon: Icon(
            MdiIcons.arrowDownBoldOutline,
            color: ColorsManager.iconGreyColor,
            size: 30,
          ),
          onTransitionIcon: Icon(MdiIcons.arrowDownBold,
              size: 30, color: ColorsManager.downVoteButtonColor),
          onPressed: () {
            setState(downVote);
          },
        ),
        const HorizontalSpace(width: 25),
        GestureDetector(
          child: Image.asset(
            AssetsManager.chatIcon,
            scale: 25,
          ),
        ),
     const HorizontalSpace(width: 5),
        const Text(
          '30',
          style: TextStyle(
            color: ColorsManager.textWhiteColor
          ),
        ),
        const Spacer(),
        Icon(
          MdiIcons.shareOutline,
          color: ColorsManager.iconGreyColor,
          size: 30,
        ),
        const HorizontalSpace(width: 20)
      ],
    );
  }
}
