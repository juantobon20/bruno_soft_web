import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {

  final bool isChecked;

  const CustomCheckbox({
    super.key,
    required this.isChecked
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: null
    );
  }
}