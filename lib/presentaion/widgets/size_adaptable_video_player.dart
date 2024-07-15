import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_feature_clone/presentaion/controller/bottom_sheet_provider.dart';
import 'package:reddit_feature_clone/presentaion/widgets/video_widget.dart';

class SizeAdaptableVideoPlayer extends StatelessWidget {
  const SizeAdaptableVideoPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 75),
        Consumer<BottomSheetProvider>(
          builder: (context, provider, child) {
            return SizedBox(
              height: 800 -
                  provider.bottomSheetHeight *
                      MediaQuery.of(context).size.height,
              width: 800 -
                  provider.bottomSheetHeight *
                      MediaQuery.of(context).size.width,
              child: const VideoWidget(),
            );
          },
        ),
      ],
    );
  }
}
