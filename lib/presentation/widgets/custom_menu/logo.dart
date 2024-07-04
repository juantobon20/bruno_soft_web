import 'package:flutter/material.dart';

import '../widgets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = context.colorSchemeFromContext();

    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
            child: Image.asset(
              'assets/logos/logo_.png',
              width: 40,
              height: 40,
            ),
          ),

          const SizedBox(width: 5),

          primaryText(text: "Bruno Soft")
          
        ],
      ),
    );
  }
}