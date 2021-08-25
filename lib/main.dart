import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:yyba_app/utils/light_model.dart';
import 'package:yyba_app/utils/log.dart';
import 'package:yyba_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // debugPrint 插件包

import 'app.dart';
import 'common/config/address.dart';
import 'common/net/net_manager.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      ErrorWidget.builder = (FlutterErrorDetails details) {
        Zone.current.handleUncaughtError(details.exception, (details.stack)!);
        return Material(
          child: Container(
            color: Colors.red,
            child: Center(
              child: Container(
                child: Text(
                  'error: ${details.exception}',
                  style: TextStyle(fontSize: 24, color: Colors.yellow[300]),
                ),
              ),
            ),
          ),
        );
      };
      startApp();
    },
    (Object obj, StackTrace stack) {
      //TODO: @lvzhiyi 上报错误日志 添加崩溃日志保存文件
      l.e('ERROR', 'onError happend ...stack:$stack  obj: $obj',
          saveFile: false);
      // l.writeCrash(obj, stackTrace: stack);
    },
  );
}

startApp() async {
  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  screen.init();
  await lightKV.init();
  netManager.init(Address.baseApiPath);

  // FlutterAlipay.setIosUrlSchema(Config.IOS_SCHEMES);
  if (kDebugMode) {
    PluginManager.instance! // 注册插件
      ..register(WidgetInfoInspector())
      ..register(WidgetDetailInspector())
      ..register(ColorSucker())
      ..register(AlignRuler())
      ..register(Performance())
      ..register(ShowCode())
      ..register(MemoryInfoPage())
      ..register(CpuInfoPage())
      ..register(DeviceInfoPanel())
      ..register(Console());
    runApp(injectUMEWidget(child: InitedApp(), enable: true)); // 初始化
  } else {
    runApp(InitedApp());
  }
}
