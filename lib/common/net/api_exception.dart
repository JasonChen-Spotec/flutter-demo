/// future 扔出的异常
class ApiException implements Exception {
  final int code = -200;
  final message = '';
  ApiException([code, message]);

  @override
  String toString() {
    if (message == '') return "ApiException:code:$code";
    return "ApiException:code:$code message:$message";
  }
}
