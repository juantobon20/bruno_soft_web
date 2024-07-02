class NetworkException implements Exception {}

class ApiFailureException implements Exception {
  final int statusCode;
  final String message;

  ApiFailureException(this.statusCode, this.message);
}

class BadRequestException implements Exception {
  final String title;
  final String message;

  BadRequestException({
    required this.title, 
    required this.message
  });
}

class UnknownFailureException implements Exception {}