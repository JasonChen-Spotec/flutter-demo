import 'dart:io';

import 'package:yyba_app/common/config/config.dart';
import 'package:yyba_app/utils/app_util.dart';
import 'package:yyba_app/utils/dio_cli.dart';
import 'package:yyba_app/utils/light_model.dart';
import 'package:yyba_app/utils/text_util.dart';
import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';
import 'client_api.dart';
import 'http_header_interceptor.dart';
import 'http_log_interceptor.dart';
import 'http_resp_interceptor.dart';

/// 连接超时15秒
const int CONNECT_TIME_OUT = 15 * 1000;

final netManager = NetManager();

final netClient = netManager.client;

class NetManager {
  static bool _inited = false;
  ClientApi? client;
  Dio? clientDio;
  init(String baseUrl) {
    clientDio =
        Dio(BaseOptions(connectTimeout: CONNECT_TIME_OUT, baseUrl: baseUrl));
    clientDio?.interceptors.add(HttpHeaderInterceptor());
    clientDio?.interceptors.add(HttpLogInterceptor());
    clientDio?.interceptors.add(HttpRespInterceptor());
    _inited = true;
    client = ClientApi(clientDio!);
    // bankApi = BankApi(_bankDio);
  }

  static bool get isInited => _inited;

  Future<String> getToken() async {
    // return Future.value(
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lc3RhbXAiOjE1OTE1MDg5NzM2OTEzOTAyMDAsInVpZCI6MzExMjQwNH0.XhTIkDCRerTtOFeqUO0esgq1g6ncjIHmspatMxyKEdg");
    return (await lightKV.getString("_key_net_token${Config.DEBUG}")) ?? '';
  }

  Future<bool> setToken(String token) async {
    // 该key不共享，不放全局变量
    return lightKV.setString("_key_net_token${Config.DEBUG}", token);
  }

  /// deviceId 不为空的话，表示切换一次设备；
  Future<String> userAgent([String? deviceId]) async {
    String oldUa = (await lightKV.getString("_key_user_agent")) ?? '';
    if (TextUtil.isEmpty(deviceId!) && TextUtil.isNotEmpty(oldUa)) {
      return oldUa;
    }
    String newUa = (await _genUserAgent(deviceId));
    if (TextUtil.isNotEmpty(newUa)) lightKV.setString("_key_user_agent", newUa);
    return newUa;
  }

  /// 清除ua
  Future<bool> clearUserAgent() {
    return lightKV.setString("_key_user_agent", '');
  }

  Future<String> _genUserAgent([String? deviceId]) async {
    if (TextUtil.isEmpty(deviceId!)) {
      var deviceDetail = await getDeviceDetails();
      deviceId = (deviceDetail['uuid']) as String;
    }

    String devType = await getDevType();
    String sysType = Platform.operatingSystem;

    // String ver = packageInfo.version;
    // String buildID = packageInfo.packageName;
    String ver = Config.innerVersion;
    String buildID = await getFixedPkgName();
    String ua = Uri.encodeComponent(
        "DevID=$deviceId;DevType=$devType;SysType=$sysType;Ver=$ver;BuildID=$buildID");
    return ua;
  }

  /// 获取修正后的pkgName
  Future<String> getFixedPkgName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  /// 服务器时间
  DateTime? _serverTime;

  /// 服务器时间和本地时间的差值
  int _diffTimeInSeconds = 0;

  /// 获取上一次服务器返回的时间
  DateTime? getServerTime() {
    if (null != _serverTime) {
      return _serverTime;
    } else {
      return DateTime.now();
    }
  }

  /// 设置服务器时间
  void setServerTime(String serverTimeS) {
    if (TextUtil.isNotEmpty(serverTimeS)) {
      _serverTime = DateTime.parse(serverTimeS);
      _diffTimeInSeconds = DateTime.now().difference(_serverTime!).inSeconds;
    }
  }

  /// 获取修复后的本地时间,应该是和服务器时间是同步的
  DateTime getFixedCurTime() {
    return DateTime.now().add(Duration(seconds: -_diffTimeInSeconds));
  }
}
