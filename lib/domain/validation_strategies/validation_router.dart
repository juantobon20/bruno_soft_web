import '../domain.dart';

class ValidationRouter {
  final Map<ValidationType, List<ValidationStrategy>> _routes = {};

  void register(ValidationType type, List<ValidationStrategy> strategies) {
    _routes[type] = strategies;
  }

  ValidationResponse validate(ValidationType type, String value) {
    final List<ValidationStrategy>? strategiesByType = _routes[type];
    if (strategiesByType == null || strategiesByType.isEmpty) {
      return ValidationResponse(isValid: false, messageError: 'Tipo de validación no encontrado');
    }

    for (var strategy in strategiesByType) {
      final messageError = strategy.validate(value);
      if (messageError != null) {
        return ValidationResponse(isValid: false, messageError: messageError);
      }
    }
    return ValidationResponse(isValid: true);
  }
}

enum ValidationType {
  email,
  userName,
  password,
  other
}