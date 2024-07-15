import 'package:flutter/material.dart';

class BottomSheetProvider with ChangeNotifier {
  double _bottomSheetHeight = 0.1;
  late DraggableScrollableController _scrollableController;

  BottomSheetProvider() {
    _scrollableController = DraggableScrollableController();
    _scrollableController.addListener(() {
      _bottomSheetHeight = _scrollableController.size;
      notifyListeners();
    });
  }

  double get bottomSheetHeight => _bottomSheetHeight;
  DraggableScrollableController get scrollableController => _scrollableController;

  void updateHeight(double height) {
    _bottomSheetHeight = height;
    notifyListeners();
  }
}
