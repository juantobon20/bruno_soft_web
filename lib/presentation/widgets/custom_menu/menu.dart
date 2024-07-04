import 'package:bruno_soft_web/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets.dart';
import 'nav_bar_avatar.dart';
import 'notification_indicator.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenCubit cubit = context.read<HomeScreenCubit>();
    final isMobile = context.isMobileDesign();
  
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          
          if (isMobile)
            IconButton(onPressed: () {
              cubit.openMenu();
            }, icon: const Icon(Icons.menu_outlined)),
          
          const SizedBox(width: 5),  
          
          //Search input
          const Expanded(
            child: CustomSearchTextField()
          ),
          const SizedBox(width: 10),
          
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