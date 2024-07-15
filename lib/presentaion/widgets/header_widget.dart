import 'package:flutter/material.dart';
import 'package:reddit_feature_clone/core/app_constants.dart';
import 'package:reddit_feature_clone/core/assets_manager.dart';
import 'package:reddit_feature_clone/core/color_manager.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: ColorsManager.iconWhiteColor,
            size: 25,
          ),
          onPressed: () {}
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 10,
          backgroundImage: AssetImage(AssetsManager.myProfilePic),
        ),
        const SizedBox(width: 5),
        const Text(AppConstsants.myUserName,
            style: TextStyle(color: ColorsManager.textWhiteColor)),
        const Spacer(),
        const Icon(Icons.more_horiz, color:ColorsManager.iconWhiteColor,),
      ],
    );
  }
}
