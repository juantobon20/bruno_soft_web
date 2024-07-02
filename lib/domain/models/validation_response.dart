class ValidationResponse {

  final bool isValid;
  final String? messageError;

  ValidationResponse({
    required this.isValid, 
    this.messageError
  });
}