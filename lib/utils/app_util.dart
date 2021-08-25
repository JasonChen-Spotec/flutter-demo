import 'dart:io';

import 'package:yyba_app/utils/log.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
// import 'package:install_plugin/install_plugin.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

/// 获取设备信息
Future<String> getDevType() async {
  String devType = "";
  try {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfoPlugin.androidInfo;
      devType = "${androidInfo.device}:${androidInfo.version.sdkInt}";
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfoPlugin.iosInfo;
      devType = "${iosInfo.systemName}:${iosInfo.systemVersion}";
    }
  } catch (e) {
    l.e("devtype", "getDevType()...error:$e");
  }
  return devType;
}

Future<Map<String, dynamic>> getDeviceDetails() async {
  String? deviceName;
  String? deviceVersion;
  String? uuid;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      deviceName = build.model;
      deviceVersion = build.version.toString();
      uuid = build.androidId; //UUID for Android
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      deviceName = data.name;
      deviceVersion = data.systemVersion;
      uuid = data.identifierForVendor; //UUID for iOS
    }
  } on PlatformException {
    print('Failed to get platform version');
  }

  return {
    'deviceType': Platform.isIOS ? 'ios' : 'andriod',
    'deviceName': deviceName,
    'deviceVersion': deviceVersion,
    'uuid': uuid
  };
}

///安装android和ios的app
installApp(String filePath) async {
  //判断权限是否已有
  if (await Permission.storage.request().isGranted) {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    deviceInfoPlugin.androidInfo.then((androidInfo) {
      // InstallPlugin.installApk(filePath, androidInfo.id);
    });
  }
}

///获取渠道
Future<String> getChannel() async {
  String channel = "";
  if (Platform.isAndroid) {
    const platform = MethodChannel("com.yinse/device");
    try {
      channel = await platform.invokeMethod("getChannel");
    } on PlatformException {
      // channel = "1";
    }
  }
  return channel;
}
