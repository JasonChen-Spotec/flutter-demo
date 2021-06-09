import 'dart:convert';

import 'package:demo_app/utils/log.dart';
import 'package:demo_app/utils/text_util.dart';
import 'package:demo_app/utils/toast_util.dart';
import 'package:dio/dio.dart';

import 'api_exception.dart';
import 'base_resp_bean.dart';
import 'code.dart';
import 'net_manager.dart';

/// 响应拦截器=>返回数据转换
class HttpRespInterceptor extends InterceptorsWrapper {
  static const String TAG = "HttpRespInterceptor";
  HttpRespInterceptor();
  @override
  Future onResponse(Response response) async {
    return handleResponse(response);
  }

  @override
  onError(DioError err) async {
    l.e("resp_interceptor",
        'onError()...path:${err.request.path} url:${err.request.uri.toString()} err:${err.toString()}',
        saveFile: true);
    return Future.value(err);
  }

  static Future<dynamic> handleResponse(Response response) async {
    if (response.statusCode != 200) {
      return Future.error(
          ApiException(response.statusCode, "statusCode is not 200"));
    }
    BaseRespBean baseResp;
    if (response.data is Map) {
      baseResp = BaseRespBean.fromJson(response.data);
    } else if (response.data is String) {
      baseResp = BaseRespBean.fromJson(json.decode(response.data));
    } else {
      return Future.error(ApiException(Code.PARSE_DATE_ERROR, '网络出错了'));
    }

    netManager.setServerTime(baseResp.time!);
    int code = baseResp.code;
    //业务层判断
    if (code == Code.SUCCESS) {
      dynamic data = baseResp.data;
      baseResp.data = data;
    } else if (code == Code.FORCE_UPDATE_VERSION) {
      //需要更新
      baseResp.msg = "您的版本需要更新了";
      // await handleVer(baseResp.data);
    } else if (code == Code.ACCOUNT_INVISIBLE) {
      //账户被封禁了
      baseResp.msg = "您的账号已被封禁了";
      dynamic data = baseResp.data;
      baseResp.data = data;
    } else if (code == Code.TOKEN_ABNORMAL) {
      //token异常
      baseResp.msg = "token异常";
    } else {
      // unknow code
      baseResp.data = null;
    }

    /// 展示提示
    if (code != Code.SUCCESS) {
      if (TextUtil.isEmpty(baseResp.tip!)) baseResp.tip = "服务器错误";
      showToast(msg: "$code:${baseResp.tip}");
    } else {
      // if (TextUtil.isNotEmpty(baseResp.tip)) {
      //   showToast(msg: baseResp.tip);
      // }
    }

    if (code != Code.SUCCESS) {
      return Future.error(ApiException(code, baseResp.tip));
    } else {
      return Future.value(baseResp.data);
    }
  }
}
