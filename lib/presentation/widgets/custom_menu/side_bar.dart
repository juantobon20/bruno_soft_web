import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../home/home.dart';
import '../widgets.dart';
import 'logo.dart';

class SideBar extends StatelessWidget {

  final List<MenuData> options;
  const SideBar({
    super.key,
    required this.options
  });

  void navigateTo(BuildContext context, String routerName) {
    context.read<HomeScreenCubit>().closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = context.colorSchemeFromContext();
    final bool isMobile = context.isMobileDesign();

    return Container(
      width: 250,
      height: double.infinity,
      color: colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: !isMobile ? 24 : 16),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
        
            const Logo(),
        
            const SizedBox(height: 32),

            for (var data in options) ...[
              MenuItem(
                text: data.text,
                icon: data.icon,
                isSelected: data.isSelected,
                onPressed: () {
                  if (data.path != null) {
                    context.go(data.path!.path);
                  }
                }
              ),

              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}