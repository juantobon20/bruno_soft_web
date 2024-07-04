import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = context.colorSchemeFromContext();

    final bool isMobile = context.isMobileDesign();
    final double imgSize = isMobile ? 150 : 400;
    final double circularSize = isMobile ? 200 : 500;

    return Container(
      decoration: _customBoxDecoration(colorScheme),
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
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  color: colorScheme.surface.withOpacity(0.5),
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _customBoxDecoration(ColorScheme colorScheme) => BoxDecoration(
    gradient: RadialGradient(
      radius: 0.5, 
      colors: [ colorScheme.secondary, colorScheme.primary]
    )
  );
}