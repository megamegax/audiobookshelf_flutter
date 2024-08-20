class Response<T> {
  final T data;
  final int statusCode;
  final String message;
  final bool success;

  Response(
      {required this.data,
      required this.message,
      required this.success,
      required this.statusCode});
}
