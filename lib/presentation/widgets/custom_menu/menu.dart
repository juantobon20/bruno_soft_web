import 'package:flutter/material.dart';

import '../widgets.dart';
import 'nav_bar_avatar.dart';
import 'notification_indicator.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          
          if (size.width < 700)
            IconButton(onPressed: () {
              //SideMenuProvider.openMenu();
            }, icon: const Icon(Icons.menu_outlined)),
          
          const SizedBox(width: 5),  

          //Search input
          if (size.width >= 390)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const CustomSearchTextField(),
            ),

          const Spacer(),

          const NotificationsIndicator(),

          const SizedBox(width: 10),

          const NavBarAvatar(),

          const SizedBox(width: 10)
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5
      )
    ]
  );
}