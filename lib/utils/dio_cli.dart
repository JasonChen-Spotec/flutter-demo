import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

final _defaultOptions = BaseOptions(
  connectTimeout: 15000,
  receiveTimeout: 15000,
  // dio 原生会加上 request header:accept-encoding gzip，导致部分请求失败
  // headers: {HttpHeaders.acceptEncodingHeader: "*"},
  validateStatus: (int? status) => status! < 600,
);

/// 创建一个支持http/http2和兼容tls证书错误的dio层
/// cur => http not http2后台暂时不支持
/// [mainThread] 默认httpclient在主线程中
Dio createDio({BaseOptions? options, bool mainThread = true}) {
  options ??= _defaultOptions;
  options.headers[HttpHeaders.acceptEncodingHeader] = "*";
  var dio = Dio(options);

  var adapter = DefaultHttpClientAdapter();
  // adapter.onHttpClientCreate = (client) {
  //   client.badCertificateCallback =
  //       (X509Certificate cert, String host, int port) => true;
  // };

  // var adapter = Http2Adapter(
  //   ConnectionManager(
  //       // 常链接闲的时候保持时间
  //       idleTimeout: 10000,
  //       // Ignore bad certificate
  //       // 兼容证书错误
  //       onClientCreate: (_, clientSetting) {
  //         clientSetting.onBadCertificate = (_) => true;
  //       }),
  // );

  dio.httpClientAdapter = adapter;

  // if (Config.PROXY &&
  //     TextUtil.isNotEmpty(Config.proxyUrl) &&
  //     dio.httpClientAdapter is DefaultHttpClientAdapter) {
  //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (client) {
  //     client.findProxy = (uri) {
  //       return Config.proxyUrl;
  //     };
  //   };
  // }
  return dio;
}

/// dio 帮助类
class DioCli {
  // final BaseOptions options;
  late Dio _dio;
  DioCli({BaseOptions? options}) {
    _dio = createDio(options: options);
  }

  /// 获取文本
  Future<Response<String>> getStr(String url,
      {Options? options,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken}) {
    final opt = options ?? Options();
    opt.responseType = ResponseType.plain;
    opt.headers = headers ?? {};
    return _dio.get<String>(url, options: opt, cancelToken: cancelToken);
  }

  // 获取二进制数据
  Future<Response<List<int>>> getBytes(String url,
      {Options? options,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken}) {
    final opt = options ?? Options();
    opt.responseType = ResponseType.bytes;
    opt.headers = headers ?? {};
    return _dio.get<List<int>>(url, options: opt, cancelToken: cancelToken);
  }

  /// 获取数据流
  Future<Response<ResponseBody>> getStream(String url,
      {Options? options,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken}) {
    final opt = options ?? Options();
    opt.responseType = ResponseType.stream;
    opt.headers = headers ?? {};
    return _dio.get<ResponseBody>(url, options: opt, cancelToken: cancelToken);
  }

  /// 获取json数据
  Future<Response<Map<String, dynamic>>> getJSON(String url,
      {Options? options,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken}) {
    final opt = options ?? Options();
    opt.responseType = ResponseType.json;
    opt.headers = headers ?? {};
    return _dio.get<Map<String, dynamic>>(url,
        options: opt, cancelToken: cancelToken);
  }

  /// 获取头
  Future<Response> getHeader(String url,
      {Options? options,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken}) {
    final opt = options ?? Options();
    opt.responseType = ResponseType.bytes;
    opt.headers = headers ?? {};
    return _dio.head(url, options: opt, cancelToken: cancelToken);
  }
}
