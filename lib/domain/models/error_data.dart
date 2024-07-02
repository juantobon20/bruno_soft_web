class ErrorData {

  final ErrorType type;
  final String title;
  final String message;

  ErrorData({
    required this.type, 
    required this.title, 
    required this.message
  });
}

enum ErrorType {
  noInternet,
  api
}