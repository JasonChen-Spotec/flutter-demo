import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

/// 原生交互常用方法封装
class MiscUtil {
  static Future<void> vibrate() async {
    return await HapticFeedback.lightImpact();
  }

  /// 获取公用的dir目录
  static Future<Directory> getCommonDir() async {
    Directory dir;
    if (Platform.isIOS) {
      dir = await getTemporaryDirectory();
    } else if (Platform.isAndroid) {
      dir = (await getExternalStorageDirectory())!;
    } else if (Platform.isFuchsia) {
      dir = await getApplicationSupportDirectory();
    } else if (Platform.isMacOS) {
      dir = await getApplicationSupportDirectory();
    } else if (Platform.isLinux) {
      dir = await getApplicationSupportDirectory();
    } else if (Platform.isWindows) {
      dir = await getApplicationSupportDirectory();
    } else {
      dir = (await getExternalStorageDirectory())!;
    }
    return dir;
  }
}
