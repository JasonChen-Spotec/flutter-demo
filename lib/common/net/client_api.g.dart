// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ClientApi implements ClientApi {
  _ClientApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String? baseUrl;

  @override
  getInviteList(pageNum, pageSize) async {
    ArgumentError.checkNotNull(pageNum, 'pageNum');
    ArgumentError.checkNotNull(pageSize, 'pageSize');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'pageNum': pageNum, 'pageSize': pageSize};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/user/product/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ServicesModel.fromJson(_result.data);
    return Future.value(value);
  }
}
