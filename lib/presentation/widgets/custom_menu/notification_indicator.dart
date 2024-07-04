import 'package:bruno_soft_web/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = context.colorSchemeFromContext();

    return IconButton(
      onPressed: () {},
      icon: Stack(
        children: [
          const Icon(
            Icons.notifications_rounded,
            size: 28,
            color: Colors.grey
          ),
      
          Positioned(
            right: 1,
            child: Container(
              width: 8,
              height: 8,
              decoration: buildBoxDecoration(colorScheme.primary),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration(Color color) => BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(100)
  );
}