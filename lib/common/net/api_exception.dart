/// future 扔出的异常
class ApiException implements Exception {
  final int code = -200;
  final message;
  ApiException([code, this.message]);

  String toString() {
    if (message == null) return "ApiException:code:$code";
    return "ApiException:code:$code message:$message";
  }
}
