import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yyba_app/utils/misc_util.dart';

typedef OnRefresh = void Function();
typedef OnLoading = void Function();

Widget pullRefresh(
    {required Widget child,
    void Function()? onRefresh,
    void Function()? onLoading,
    required RefreshController refreshController,
    bool enablePullDown = true}) {
  return SmartRefresher(
      enablePullDown: enablePullDown,
      enablePullUp: true,
      header: WaterDropHeader(
        complete: Text(
          '刷新完成',
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
      footer: ClassicFooter(
          loadingText: '加载中……',
          canLoadingText: '松开加载更多',
          noDataText: '没有更多数据',
          idleText: '上啦加载更多',
          textStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.normal)),
      controller: refreshController,
      onRefresh: () {
        MiscUtil.vibrate();
        onRefresh!();
      },
      onLoading: () {
        MiscUtil.vibrate();
        onLoading!();
      },
      child: child);
}
