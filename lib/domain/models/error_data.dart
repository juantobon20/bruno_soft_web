class ErrorData {

  final ErrorType type;
  final String title;
  final String message;

  ErrorData({
    required this.type, 
    this.title = "", 
    this.message = ""
  });
}

enum ErrorType {
  noInternet,
  api
}