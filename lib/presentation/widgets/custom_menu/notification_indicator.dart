import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.notifications_none_outlined, color: Colors.grey),
    
        Positioned(
          right: 2,
          child: Container(
            width: 5,
            height: 5,
            decoration: buildBoxDecoration(),
          ),
        )
      ],
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(100)
  );
}