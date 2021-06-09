import 'package:flutter/material.dart';

// 底部区域是否透明的
class BottomTransModel with ChangeNotifier {
  int _homeIndex = 0;
  int _subIndex = 1;

  void setHomeIndex(int homeIndex) {
    if (_homeIndex != homeIndex) {
      _homeIndex = homeIndex;
      notifyListeners();
    }
  }

  void setSubIndex(int subIndex) {
    if (_subIndex != subIndex) {
      _subIndex = subIndex;
      notifyListeners();
    }
  }

  bool get trans => _homeIndex == 3 && _subIndex == 1;
}
