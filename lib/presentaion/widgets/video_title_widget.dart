import 'package:flutter/material.dart';
import 'package:reddit_feature_clone/core/app_constants.dart';
import 'package:reddit_feature_clone/core/assets_manager.dart';
import 'package:reddit_feature_clone/core/color_manager.dart';
import 'package:reddit_feature_clone/core/spacing.dart';

class VideoTitleWidget extends StatelessWidget {
  const VideoTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(AssetsManager.myProfilePic),
            ),
            HorizontalSpace(
              width: 5,
            ),
            Text(AppConstsants.myUserName,
                style: TextStyle(
                    color: ColorsManager.textWhiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        VerticalSpace(height: 20),
        Text(AppConstsants.videoCaption,
            style: TextStyle(
                color: ColorsManager.textWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}
