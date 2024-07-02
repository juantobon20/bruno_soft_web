import 'package:flutter/material.dart';

class Background extends StatelessWidget {

  final Widget body;
  const Background({
    super.key,
    required this.body
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: body,
    );
  }
}