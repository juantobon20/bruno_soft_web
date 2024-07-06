import 'package:flutter/material.dart';

import '../../../configs/config.dart';

class MenuData {
  final IconData icon;
  final String text;
  final bool isSelected;
  final RouterPath? path;

  MenuData({
    required this.icon, 
    required this.text, 
    required this.isSelected,
    this.path
  });

  MenuData copyWith({
    bool? isSelected
  }) => MenuData(
    icon: icon, 
    text: text, 
    isSelected: isSelected ?? this.isSelected,
    path: path
  );
}