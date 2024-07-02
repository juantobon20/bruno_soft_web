import 'package:flutter/material.dart';

class AppTheme {
  
  ThemeData getTheme() {
    return ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF0B0B)),
        useMaterial3: true,
    );
  }
}