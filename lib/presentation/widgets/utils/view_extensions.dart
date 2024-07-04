import 'package:flutter/material.dart';

extension ColorSchemeContext on BuildContext {

  ColorScheme colorSchemeFromContext() {
    return Theme.of(this).colorScheme;
  }
}

extension IsMobileContext on BuildContext {
  
  bool isMobileDesign() {
    final Size size = MediaQuery.sizeOf(this);
    return size.width < 1000;
  }
}