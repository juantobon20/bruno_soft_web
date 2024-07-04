class FieldData {

  final String text;
  final String? error;
  final bool isValid;

  const FieldData({
    this.text = "", 
    this.isValid = false,
    this.error
  });

  FieldData copyWith({
    String? text,
    String? error,
    bool isValid = false
  }) => FieldData(
    text: text ?? this.text,
    error: error,
    isValid: isValid
  );
}