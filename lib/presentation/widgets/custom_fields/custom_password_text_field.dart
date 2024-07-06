import 'package:flutter/material.dart';

import '../widgets.dart';
import 'container_text_field.dart';


class CustomPasswordTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final double width;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry padding;
  final Icon? icon;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const CustomPasswordTextField({
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
  State<CustomPasswordTextField> createState() => _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
          labelStyle: CustomTextFont.textFieldStyle,
          hintText: widget.hintText.isEmpty && widget.labelText.isNotEmpty ? widget.labelText : widget.hintText,
          hintStyle: CustomTextFont.textFieldStyle,
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(_isHidden ? Icons.visibility : Icons.visibility_off)
          ),
          prefixIcon: widget.icon,
          errorText: widget.errorText,
          errorStyle: CustomTextFont.textFieldStyle
      ),
      keyboardType: widget.keyboardType,
      obscureText: _isHidden,
      onChanged: widget.onChanged,
      style: CustomTextFont.textFieldStyle
    );

    return containerTextFieldBuild(
        padding: widget.padding,
        width: widget.width,
        textField: textField
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}