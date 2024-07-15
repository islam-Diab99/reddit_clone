import 'package:flutter/material.dart';
import 'package:reddit_feature_clone/core/color_manager.dart';
import 'package:reddit_feature_clone/presentaion/controller/bottom_sheet_provider.dart';
import 'package:provider/provider.dart';
import 'package:reddit_feature_clone/presentaion/controller/video_player_provider.dart';
import 'package:reddit_feature_clone/presentaion/controller/comments_peovider.dart';
import 'package:reddit_feature_clone/presentaion/screens/video_player_screen.dart';

class RedditCloneApp extends StatelessWidget {
  const RedditCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomSheetProvider()),
        ChangeNotifierProvider(create: (_) => VideoPlayerProvider()),
        ChangeNotifierProvider(create: (_) => CommentsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            iconTheme: const IconThemeData(color: ColorsManager.iconGreyColor)),
        home: const VideoPlayerScreen(),
      ),
    );
  }
}
