import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _customBoxDecoration,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/logos/logo.png",
                width: 400,
                height: 400,
              )
            ),

            const Center(
              child: SizedBox(
                width: 500,
                height: 500,
                child: CircularProgressIndicator(
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