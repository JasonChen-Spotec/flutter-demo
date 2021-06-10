import 'package:yyba_app/common/config/config.dart';
import 'package:flutter/material.dart';

class RouterCtrl {
  /// 安全退出页面和对话框
  static void pop([dynamic res]) {
    if (Navigator.of(Config.appContext).canPop()) {
      Navigator.of(Config.appContext).pop(res);
    }
  }

  static void popTo(String routeName, [dynamic res]) {
    Navigator.of(Config.appContext).popAndPushNamed(routeName, arguments: res);
  }

  static Object? push(String routeName, {Map<String, dynamic>? args}) async {
    var res = await Navigator.of(Config.appContext)
        .pushNamed(routeName, arguments: args);
    return res;
  }

  static Object? replace(String routeName, {Map<String, dynamic>? args}) async {
    var res = await Navigator.of(Config.appContext)
        .pushReplacementNamed(routeName, arguments: args);
    return res;
  }
}
