import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ViewCtrl with ChangeNotifier {
  RefreshController refreshController = RefreshController(initialRefresh: true);

  onRefresh(int index) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      refreshController.refreshCompleted();
    });
  }

  onLoading(int index) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      refreshController.loadComplete();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
