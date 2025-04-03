class NetworkResponse{
  final String message;
  final dynamic data;
  final int status;

  NetworkResponse({
    required this.message,
    this.data,
    required this.status,
  });

  @override
  String toString() {
    return 'NetworkResponse{message: $message, data: $data}';
  }

  bool get isSuccess => status == 200;
}