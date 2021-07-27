import 'package:flutter/material.dart';

class Config {
  static const DEBUG = !bool.fromEnvironment("dart.vm.product");
  static const PROXY = false;
  static const proxyUrl = '';
  // 打开cdn源站 避免访问平凡无法测试的情况
  static const OPEN_SOURCE = false;

  /// header里面，服务器返回,更新使用
  /// note-this:请保持pubspec.yaml一致
  static const innerVersion = "1.0.0";

  static const UMENG_ANDROID_KEY = "";

  static const UMENG_IOS_KEY = "";

  static const PAGE_SIZE = 10;

  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  /// 获取顶层BuildContext
  static BuildContext get appContext =>
      Config.navigatorKey.currentState!.overlay!.context;
}
