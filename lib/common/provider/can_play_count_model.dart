import 'package:flutter/cupertino.dart';

final PlayCountModel playCountModel = PlayCountModel();

/// 剩余播放次数
class PlayCountModel with ChangeNotifier {
  ///剩余播放的次数
  int _canPlayCnt = 0;
  int totalCnt = 0;
  void setPlayCnt(int canPlayNum) {
    if (canPlayNum == _canPlayCnt) return;
    _canPlayCnt = canPlayNum;
    notifyListeners();
  }

  void setTotalCnt(int t) {
    totalCnt = t;
  }

  void decreasePlayCnt() {
    _canPlayCnt--;
    notifyListeners();
  }

  int get canPlayCnt => _canPlayCnt < 0 ? 0 : _canPlayCnt;
}
