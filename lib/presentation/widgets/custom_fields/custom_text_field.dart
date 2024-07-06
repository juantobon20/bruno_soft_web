import 'package:flutter/material.dart';

import '../widgets.dart';
import 'container_text_field.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final double width;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry padding;
  final Icon? icon;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    this.labelText = '',
    this.hintText = '',
    this.width = double.infinity,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.padding = const EdgeInsets.all(10),
    this.icon,
    this.errorText,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          labelStyle: CustomTextFont.textFieldStyle,
          hintText: hintText.isEmpty && labelText.isNotEmpty ? labelText : hintText,
          hintStyle: CustomTextFont.textFieldStyle,
          prefixIcon: icon,
          errorText: errorText,
          errorStyle: CustomTextFont.textFieldStyle          
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: CustomTextFont.textFieldStyle
    );

    return containerTextFieldBuild(
        padding: padding,
        width: width,
        textField: textField
    );
  }
}