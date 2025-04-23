import 'package:flutter/material.dart';

class DiscoverProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void incrementIndex() {
    currentIndex++;
    notifyListeners();
  }
}
