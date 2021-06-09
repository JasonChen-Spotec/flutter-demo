import 'dart:async';

import 'package:yyba_app/utils/light_model.dart';
import 'package:yyba_app/utils/log.dart';
import 'package:yyba_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      ErrorWidget.builder = (FlutterErrorDetails details) {
        Zone.current.handleUncaughtError(details.exception, (details.stack)!);
        return Container(
          color: Colors.transparent,
        );
      };
      startApp();
    },
    (Object obj, StackTrace stack) {
      //添加崩溃日志保存文件
      l.e('ERROR', 'onError happend ...stack:$stack  obj: $obj',
          saveFile: false);
      l.writeCrash(obj, stackTrace: stack);
    },
  );
}

startApp() async {
  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  screen.init();
  await lightKV.init();
  // FlutterAlipay.setIosUrlSchema(Config.IOS_SCHEMES);
  runApp(InitedApp());
}
