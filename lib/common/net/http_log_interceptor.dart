import 'package:demo_app/common/config/config.dart';
import 'package:demo_app/utils/log.dart';
import 'package:dio/dio.dart';

/// 网络日志拦截器
class HttpLogInterceptor extends InterceptorsWrapper {
  static const String TAG = "http_log";
  HttpLogInterceptor();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    l.d(TAG, '################# BEGIN REQUEST #####################\n',
        saveFile: false);
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
    l.d(TAG, '################# END REQUEST #####################\n',
        saveFile: false);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    l.d(TAG, '################# BEGIN RESPONSE #####################\n',
        saveFile: false);
    l.d(TAG,
        'url:${response.requestOptions.uri}  path:${response.requestOptions.path}\n',
        saveFile: false);
    if (Config.DEBUG)
      l.d(TAG, 'begin resp: ${response.toString()}\n', saveFile: false);
    l.d(TAG, '################# END RESPONSE #####################\n',
        saveFile: false);
  }

  // @override
  // onError(DioError err) async {
  //   l.e(TAG,
  //       'logIntercepter()... onError...url:${err.request.uri.toString()}...path:${err.request.path} err:${err.toString()}',
  //       saveFile: true);
  //   return Future.value(err);
  // }
}
