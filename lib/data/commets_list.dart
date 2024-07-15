import 'package:reddit_feature_clone/core/assets_manager.dart';
import 'package:reddit_feature_clone/models/comment._model.dart';

List<Comment> commentsList = [
  Comment(
  votesCount: 3,
    userProfileImage: AssetsManager.user1ProfilePic,
    userProfileName:'Michael Brown' ,
    content: 'Unbelievable!',
    isUpVoted: false,
    isDownVoted: false,
    replies: [
      Comment(
  votesCount: 4,
    userProfileImage: AssetsManager.user2ProfilePic,
    userProfileName:'Robert Martinez' ,
    content: 'it like a heaven',
    isUpVoted: false,
    isDownVoted: false,
        replies: [
          Comment(
  votesCount: 1,
    userProfileImage: AssetsManager.user3ProfilePic,
    userProfileName:'Jessica Miller' ,
    content: 'yup',
    isUpVoted: false,
    isDownVoted: false,
            replies: [],
          ),
        ],
      ),
    ],
  ),
  Comment(
  votesCount: 7,
    userProfileImage: AssetsManager.user4ProfilePic,
    userProfileName:'John Smith' ,
    content: 'Charm!',
    isUpVoted: false,
    isDownVoted: false,
    replies: [],
  ),
];