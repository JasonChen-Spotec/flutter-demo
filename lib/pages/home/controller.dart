import 'package:flutter/material.dart';

class ViewCtrl with ChangeNotifier {
  int tabIndex = 3;

  changeTab(int index) {
    tabIndex = index;
    notifyListeners();
  }
}
