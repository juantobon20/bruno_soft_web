import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/home.dart';
import '../widgets.dart';
import 'logo.dart';
import 'menu_data.dart';
import 'menu_item.dart';

class SideBar extends StatelessWidget {

  final List<MenuData> options;
  const SideBar({
    super.key,
    required this.options
  });

  void navigateTo(BuildContext context, String routerName) {
    context.read<HomeScreenCubit>().closeMenu();
    /*
    NavigationService.replaceTo(routerName);*/
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = context.colorSchemeFromContext();

    return Container(
      width: 250,
      height: double.infinity,
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
        
            const Logo(),
        
            const SizedBox(height: 32),

            for (var data in options) ...[
              MenuItem(
                text: data.text,
                icon: data.icon,
                isActive: data.isActive, // provider.currentPage == Flurorouter.dashboardRoute,
                onPressed: () {}
              ),

              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}