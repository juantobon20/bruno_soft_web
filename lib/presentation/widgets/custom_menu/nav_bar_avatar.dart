import 'package:flutter/material.dart';

import '../../../configs/config.dart';
import '../widgets.dart';


class NavBarAvatar extends StatelessWidget {
  const NavBarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobileDesign();
    final ColorScheme colorScheme = context.colorSchemeFromContext();

    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
            child: ClipOval(
              child: Image.asset(
                'assets/icons/user_profile.png',
                width: 30,
                height: 30
              ),
            ),
          ),
      
          if (!isMobile) ...[
            const SizedBox(width: 8),
      
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                secondaryText(text: 'Juan Tobon'),
                tertiaryText(
                  text: 'Administrador',
                  textColor: CustomColors.secondaryText
                )
              ],
            )
          ]
        ],
      ),
    );
  }
}