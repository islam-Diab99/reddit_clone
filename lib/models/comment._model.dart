

class Comment {
  String userProfileImage;
  String userProfileName;
  String content;
  bool isUpVoted;
  bool isDownVoted;
  int votesCount;

  List<Comment> replies;

  Comment(
      {required this.content,
      required this.isUpVoted,
      required this.isDownVoted,
      required this.replies,
       required this.votesCount,
      required this.userProfileImage,
      required this.userProfileName
      });
}
