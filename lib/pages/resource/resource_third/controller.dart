import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yyba_app/widgets/common/pull_refresh.dart';

class ViewCtrl with ChangeNotifier {
  RefreshController refreshController = RefreshController(initialRefresh: true);
  late Timer _timer;

  onRefresh(int index) {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      refreshController.refreshCompleted();
    });
  }

  onLoading(int index) {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      refreshController.loadComplete();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
