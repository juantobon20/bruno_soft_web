import 'package:flutter/material.dart';

import '../custom_text/custom_text.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.bubble_chart_outlined, color: Color(0xFF6A6BF5),),

          const SizedBox(width: 10),

          titleText(text: 'Admin')
        ],
      ),
    );
  }
}