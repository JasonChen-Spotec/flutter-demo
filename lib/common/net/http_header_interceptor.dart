import 'dart:io';

import 'package:dio/dio.dart';

/// 请求header拦截器
/// 主要是为每个请求添加header
class HttpHeaderInterceptor extends InterceptorsWrapper {
  HttpHeaderInterceptor();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // var token = await netManager.getToken();
    // options.headers["Authorization"] = token;
    // l.d('http_log', 'token:$token');
    if (options.method == "GET") {
      options.headers["Content-Type"] = "application/x-www-form-urlencoded";
    } else if (options.method == "POST") {
      options.headers["Content-Type"] = "application/json;charset=UTF-8";
    }
    // options.headers["User-Agent"] = await netManager.userAgent();
    // options.headers["Accept"] = "application/json;charset=UTF-8";
    // options.headers["app_version"] = version.versionLocal;
    options.headers["api_version"] = "1.0.0";
    options.headers["device"] = Platform.operatingSystem;

    return handler.next(options);
  }

  // @override
  // onResponse(Response response) {
  //   var token = response.headers.map['refresh-authorization']?.last;
  //   if (token != null) {
  //     setToken(token);
  //   }
  //   return Future.value(response);
  // }
}
