import 'package:flutter/material.dart';

import '../widgets.dart';

class TextSeparator extends StatelessWidget {

  final String text;
  const TextSeparator({
    super.key, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 5),
      child: tertiaryText(
        text: text,
        textColor: Colors.white.withOpacity(0.3) 
      )
    );
  }
}