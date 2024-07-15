import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_feature_clone/core/app_constants.dart';
import 'package:reddit_feature_clone/core/color_manager.dart';
import 'package:reddit_feature_clone/core/spacing.dart';
import 'package:reddit_feature_clone/models/comment._model.dart';
import 'package:reddit_feature_clone/presentaion/controller/comments_peovider.dart';

// ignore: must_be_immutable
class CommentScreen extends StatefulWidget {
  CommentScreen({
    super.key,
    required this.profileName,
    required this.contentToReply,
    required this.isReply,
    this.comment,
  });
  final String profileName;
  final String contentToReply;
  final bool isReply;
  Comment? comment;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final FocusNode _commentFocusNode = FocusNode();

  TextEditingController replyController = TextEditingController();
@override
  void initState() {
WidgetsBinding.instance.addPostFrameCallback((_) {
      _commentFocusNode.requestFocus();
    });;  
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBGColor,
      appBar: _buildCommentScreenAppBar(context),
      body: _buildCommentScreenBody(_commentFocusNode),
    );
  }

  Padding _buildCommentScreenBody(commentFocusNode) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isReply
              ? Text(
                  widget.profileName,
                  style: const TextStyle(color: Colors.white),
                )
              : const SizedBox(),
          const VerticalSpace(height: 10),
          Text(
            widget.contentToReply,
            style: const TextStyle(color: ColorsManager.textWhiteColor),
          ),
          const VerticalSpace(height: 15),
          const Divider(),
          TextField(
            controller: replyController,
            style: const TextStyle(color: ColorsManager.textWhiteColor),
            focusNode: commentFocusNode,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: AppConstsants.commentFieldHintText,
                hintStyle: TextStyle(color: ColorsManager.textGreyColor)),
          )
        ],
      ),
    );
  }

  AppBar _buildCommentScreenAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.darkBGColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.close,
        ),
        color: ColorsManager.iconGreyColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        widget.isReply ? AppConstsants.replyText : AppConstsants.addACommentText,
        style: const TextStyle(color: ColorsManager.textWhiteColor),
      ),
      actions: [
        Consumer<CommentsProvider>(
          builder: (context, commentsProvider, child) => TextButton(
            child: const Text(
              AppConstsants.postText,
            ),
            onPressed: () {
              if (replyController.text.isNotEmpty) {
                commentsProvider.addReply(widget.comment, replyController.text);
                Navigator.pop(context);
              }
            },
          ),
        )
      ],
    );
  }
}
