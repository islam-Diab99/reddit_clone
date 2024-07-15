import 'package:flutter/material.dart';
import 'package:reddit_feature_clone/core/app_constants.dart';
import 'package:reddit_feature_clone/core/assets_manager.dart';
import 'package:reddit_feature_clone/data/commets_list.dart';
import 'package:reddit_feature_clone/models/comment._model.dart';

class CommentsProvider with ChangeNotifier {
  final List<Comment> _comments = commentsList;

  List<Comment> get comments => _comments;

  void upvote(Comment comment) {
    if (comment.isUpVoted) {
     
      comment.isUpVoted = false;
      comment.votesCount--;
    } 
       else if (comment.isDownVoted) {
      
        comment.isDownVoted = false;
        comment.isUpVoted = true;
        comment.votesCount+=2;
      }
    else {
   
      comment.isUpVoted = true;
      comment.votesCount++;

   
    }

    notifyListeners();
  }

  void downvote(Comment comment) {
     if (comment.isDownVoted) {
     
      comment.isDownVoted = false;
      comment.votesCount++;
    } 
       else if (comment.isUpVoted) {
      
        comment.isUpVoted = false;
         comment.isDownVoted = true;
        comment.votesCount-=2;
      }
    else {
   
      comment.isDownVoted = true;
      comment.votesCount--;

   
    }

    notifyListeners();
  }


  void addReply(Comment? comment, String replyContent) {
    var newComment = Comment(
      content: replyContent,
      isUpVoted: false,
      isDownVoted: false,
      replies: [],
      votesCount: 0,
      userProfileImage: AssetsManager.myProfilePic,
      userProfileName: AppConstsants.myUserName
    );

    if (comment == null) {
      _comments.add(newComment);
    } else {
      comment.replies.add(newComment);
    }
    notifyListeners();
  }


}

