import 'package:flutter/material.dart';
import 'package:reddit_feature_clone/core/assets_manager.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerProvider extends ChangeNotifier {
  late VideoPlayerController _controller;
  bool _isError = false;
  String _errorMessage = '';
  bool _showComments = false;

  VideoPlayerController get controller => _controller;
  bool get isError => _isError;
  String get errorMessage => _errorMessage;
  bool get showComments => _showComments;

  VideoPlayerProvider() {
    _controller = VideoPlayerController.asset(
      AssetsManager.natureReelVideo,
    )
      ..addListener(_onVideoChanged)
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        notifyListeners();
      }).catchError((error) {
        _isError = true;
        _errorMessage = error.toString();
        notifyListeners();
      });
  }

  void pauseOrPlayVideo() {
    _controller.value.isPlaying ? _controller.pause() : _controller.play();
    notifyListeners();
  }

  void _onVideoChanged() {
    notifyListeners();
  }

  void toggleVideoSound() {
    _controller.value.volume == 1
        ? _controller.setVolume(0)
        : _controller.setVolume(1);
    notifyListeners();
  }

  void disposeController() {
    _controller.dispose();
    _controller.removeListener(_onVideoChanged);
  }

  void toggleComments() {
    _showComments = !_showComments;
    notifyListeners();
  }
}
