import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reddit_feature_clone/core/spacing.dart';
import 'package:reddit_feature_clone/data/post_data.dart';
import 'package:reddit_feature_clone/presentaion/screens/comment_screen.dart';
import 'package:reddit_feature_clone/presentaion/widgets/animated_icon_widget.dart';
import 'package:reddit_feature_clone/models/comment._model.dart';
import 'package:reddit_feature_clone/presentaion/controller/comments_peovider.dart';
import 'package:reddit_feature_clone/presentaion/widgets/comment_connector_builder.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({
    super.key,
    this.scrollController,
  });
  final scrollController;

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  final TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: Consumer<CommentsProvider>(
              builder: (context, commentsProvider, child) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: ListView.builder(
                        controller: widget.scrollController,
                        itemCount: commentsProvider.comments.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildComment(
                              commentsProvider.comments[index], context),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          _buildAddCommentButton(),
          const VerticalSpace(height: 10),
        ],
      ),
    );
  }

  Widget _buildAddCommentButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CommentScreen(
                contentToReply: natureVideoPost.caption,
                isReply: false,
                profileName: natureVideoPost.userProfileName),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xFf19171A),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Add a comment',
              style: TextStyle(color: Color(0xFF5E5C5E)),
            )),
      ),
    );
  }

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }
}

Widget _buildComment(Comment comment, context, {int depth = 0}) {
  return Consumer<CommentsProvider>(
    builder: (context, commentsProvider, child) {
      return CustomPaint(
        painter: CommentConnectorPainter(depth: depth),
        child: Padding(
          padding: EdgeInsets.only(left: depth * 16.0, top: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCommentHeader(comment),
              const SizedBox(height: 8),
              Text(
                comment.content,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              const SizedBox(height: 8),
              _buildCommentActions(comment, commentsProvider, context),
              const SizedBox(height: 8),
              ...comment.replies.map(
                  (reply) => _buildComment(reply, context, depth: depth + 1)),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildCommentHeader(Comment comment) {
  return Row(
    children: [
      CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage(comment.userProfileImage),
      ),
      const SizedBox(width: 7),
      Text(
        comment.userProfileName,
        style: const TextStyle(color: Color(0xFF686669)),
      ),
    ],
  );
}

Widget _buildCommentActions(
    Comment comment, CommentsProvider commentsProvider, context) {
  return SizedBox(
    height: 15,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(MdiIcons.dotsHorizontal),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CommentScreen(
                    contentToReply: comment.content,
                    isReply: true,
                    comment: comment,
                    profileName: comment.userProfileName),
              ),
            );
          },
          child: Icon(MdiIcons.arrowLeftTop),
        ),
        const SizedBox(width: 10),
        Icon(MdiIcons.seal),
        const SizedBox(width: 10),
        AnimatedIconWidget(
          isActive: comment.isUpVoted,
          transitionDirection: TransitionDirection.up,
          defaultIcon: Icon(MdiIcons.arrowUpBoldOutline),
          onTransitionIcon: Icon(
            MdiIcons.arrowUpBold,
            size: 25,
            color: comment.isUpVoted ? Colors.redAccent : null,
          ),
          onPressed: () {
            commentsProvider.upvote(comment);
          },
        ),
        const SizedBox(width: 5),
        Text(
          '${comment.votesCount}',
          style: TextStyle(
            color: comment.isUpVoted
                ? Colors.redAccent
                : comment.isDownVoted
                    ? const Color.fromARGB(200, 155, 181, 255)
                    : Colors.grey,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          child: AnimatedIconWidget(
            isActive: comment.isDownVoted,
            transitionDirection: TransitionDirection.down,
            defaultIcon: Icon(MdiIcons.arrowDownBoldOutline),
            onTransitionIcon: Icon(
              MdiIcons.arrowDownBold,
              color: comment.isDownVoted
                  ? const Color.fromARGB(200, 155, 181, 255)
                  : null,
            ),
            onPressed: () {
              commentsProvider.downvote(comment);
            },
          ),
        ),
      ],
    ),
  );
}
