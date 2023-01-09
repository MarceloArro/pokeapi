class NetworkException implements Exception {
  const NetworkException({this.message});

  final String? message;

  @override
  String toString() {
    return 'Instancia de NetworkException: $message';
  }
}
