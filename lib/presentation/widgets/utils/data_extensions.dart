extension Formats on String {

  String formatPhone() {
    if (length != 10) {
      return this;
    }
    return '(${substring(0, 3)}) ${substring(3, 6)} ${substring(6)}';
  }

  String formatNit() {
    if (trim().isEmpty) return '';

    final formatted = StringBuffer();
    int dotCount = 0;

    for (int i = length - 1; i >= 0; i--) {
      formatted.write(this[i]);
      if (++dotCount % 3 == 0 && i > 0) {
        formatted.write('.');
      }
    }

    return formatted.toString().split('').reversed.join('');
  }

  String toTitleCase() {
    return toLowerCase()
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
  }
}