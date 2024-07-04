import 'package:flutter/material.dart';

import 'container_button.dart';
import 'label_button.dart';

class TertiaryButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final Icon? icon;
  final VoidCallback onPressedCallback;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;

  const TertiaryButton({
    super.key, 
    this.isLoading = false, 
    this.icon,
    required this.text, 
    required this.onPressedCallback,
    this.width = double.infinity,
    this.height = 50,
    this.padding = const EdgeInsets.all(10)
  });

  @override
  Widget build(BuildContext context) {
    TextButton button;
    var labelBtn = labelButtonBuild(text: text, isLoading: isLoading);

    if (icon != null) {
      button = TextButton.icon(
        onPressed: onPressed(isLoading, onPressedCallback), 
        icon: icon!, 
        label: labelBtn
      );
    } else {
      button = TextButton(
        onPressed: onPressed(isLoading, onPressedCallback),
        child: labelBtn
      );
    }

    return containerButtonBuild(
      context: context, 
      width: width, 
      height: height, 
      padding: padding, 
      child: button
    );
  }
}