import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ViewCtrl with ChangeNotifier {
  RefreshController refreshController = RefreshController(initialRefresh: true);

  onRefresh() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      refreshController.refreshCompleted();
    });
  }

  onLoading() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      refreshController.loadComplete();
    });
  }

  timeStart() {}
}
