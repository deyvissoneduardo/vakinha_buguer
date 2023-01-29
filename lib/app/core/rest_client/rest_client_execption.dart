class RestClientExecption implements Exception {
  int? code;
  String message;

  RestClientExecption(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientExecption(code: $code, message: $message)';
}
