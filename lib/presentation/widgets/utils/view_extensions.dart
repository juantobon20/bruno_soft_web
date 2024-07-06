import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {

  ColorScheme colorSchemeFromContext() {
    return Theme.of(this).colorScheme;
  }

   bool isMobileDesign() {
    final Size size = MediaQuery.sizeOf(this);
    return size.width < 1000;
  }
}