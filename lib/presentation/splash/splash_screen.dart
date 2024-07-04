import 'package:flutter/material.dart';

import '../../utils/view_extensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = isMobileDesign(MediaQuery.of(context).size);
    final double imgSize = isMobile ? 150 : 400;
    final double circularSize = isMobile ? 200 : 500;

    return Container(
      decoration: _customBoxDecoration,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/logos/logo.png",
                width: imgSize,
                height: imgSize,
              )
            ),

            Center(
              child: SizedBox(
                width: circularSize,
                height: circularSize,
                child: const CircularProgressIndicator(
                  strokeWidth: 10,
                  color: Color(0x78FF0A1A),
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  final BoxDecoration _customBoxDecoration = const BoxDecoration(
    gradient: RadialGradient(
      radius: 0.9, 
      colors: [Color(0x78FF0A1A), Color(0xFFFF0B0B)]
    )
  );
}