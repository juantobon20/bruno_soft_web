import 'validation_strategy.dart';

class ValidationRouter {
  final Map<ValidationType, List<ValidationStrategy>> _routes = {};

  void register(ValidationType type, List<ValidationStrategy> strategies) {
    _routes[type] = strategies;
  }

  String? validate(ValidationType type, String value) {
    final List<ValidationStrategy>? strategiesByType = _routes[type];
    if (strategiesByType == null || strategiesByType.isEmpty) {
      return 'Tipo de validación no encontrado';
    }

    for (var strategy in strategiesByType) {
      final validate = strategy.validate(value);
      if (validate != null) {
        return validate;
      }
    }
    return null;
  }
}

enum ValidationType {
  email,
  userName,
  password,
  other
}