import 'dart:developer';

import 'package:yyba_app/common/config/config.dart';
import 'package:yyba_app/utils/log.dart';
import 'package:dio/dio.dart';

/// 网络日志拦截器
class HttpLogInterceptor extends InterceptorsWrapper {
  static const String TAG = "http_log";
  HttpLogInterceptor();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('################# BEGIN REQUEST #####################\n');
    l.d(TAG,
        'method:${options.method}  path:${options.path.toString()} url:${options.uri.toString()}\n',
        saveFile: false);
    if (options.method == "POST") {
      l.d(TAG,
          'bodyParam:${options.data.toString()} extra:${options.extra.toString()}\n',
          saveFile: false);
    } else if (options.method == "GET") {
      l.d(TAG,
          'queryParam:${options.queryParameters.toString()} extra:${options.extra.toString()}\n',
          saveFile: false);
    }
    l.d(TAG, 'header:${options.headers.toString()}\n', saveFile: false);
    log('################# END REQUEST #####################\n');

    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    log('################# BEGIN RESPONSE #####################\n');
    l.d(TAG,
        'url:${response.requestOptions.uri}  path:${response.requestOptions.path}\n',
        saveFile: false);
    if (Config.DEBUG)
      l.d(TAG, 'begin resp: ${response.toString()}\n', saveFile: false);
    log('################# END RESPONSE #####################\n');
    return handler.next(response);
  }

  // @override
  // onError(DioError e, handler) async {
  //   l.e(TAG,
  //       'logIntercepter()... onError...url:${e.request.uri.toString()}...path:${e.request.path} err:${err.toString()}',
  //       saveFile: true);
  //   return handler.next(e);
  // }
}
