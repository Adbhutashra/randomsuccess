import 'package:flutter/material.dart';

class SuccessCountRepository extends ChangeNotifier {
  int _successCount = 0;

  int get successCount => _successCount;

  void incrementSuccessCount() {
    _successCount++;
    notifyListeners();
  }
}