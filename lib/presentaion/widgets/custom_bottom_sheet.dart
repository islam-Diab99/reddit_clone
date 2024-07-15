import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_feature_clone/core/color_manager.dart';
import 'package:reddit_feature_clone/presentaion/controller/bottom_sheet_provider.dart';
import 'package:reddit_feature_clone/presentaion/controller/comments_peovider.dart';
import 'comments_widget.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommentsProvider(),
      child: PopScope(
        canPop: false,
        child: Consumer<BottomSheetProvider>(
          builder: (context, provider, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              provider.updateHeight(provider.scrollableController.size);
            });

            return DraggableScrollableSheet(
              controller: provider.scrollableController,
              initialChildSize: 0.6,
              minChildSize: 0.1,
              snap: false,
              shouldCloseOnMinExtent: true,
              maxChildSize: 0.6,
              expand: false,
              builder: (context, scrollController) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: ColorsManager.darkBGColor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: CommentsWidget(
                      scrollController: scrollController,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
