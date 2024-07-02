abstract class ValidationStrategy {
  String? validate(String value);
}

class PasswordValidationStrategy implements ValidationStrategy {
  @override
  String? validate(String value) {
    RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{6,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'La contraseña debe tener al menos 6 caracteres\nUna mayúscula\nUna minúscula\nUn número\nUn carácter especial.';
    }
    return null;
  }
}

class EmailValidationStrategy implements ValidationStrategy {
  @override
  String? validate(String value) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor ingrese un correo electrónico válido';
    }
    return null;
  }
}

class EmptyValidationStrategy implements ValidationStrategy {
  @override
  String? validate(String value) {
    if (value.trim().isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }
}

class MinimumValidationStrategy implements ValidationStrategy {

  int minimumLength = 6;

  void setMinimum(int minimumLength) {
    this.minimumLength = minimumLength;
  }

  @override
  String? validate(String value) {
    if (value.length < minimumLength) {
      return 'Debe tener mínimo $minimumLength carácteres';
    }
    return null;
  }

}