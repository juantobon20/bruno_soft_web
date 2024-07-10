import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../home/home.dart';
import '../widgets.dart';
import 'logo.dart';
import 'text_separator.dart';

class SideBar extends StatelessWidget {

  final List<MenuTitleData> menuOptions;
  const SideBar({
    super.key,
    required this.menuOptions
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

            for (var data in menuOptions) ...[
              if (data.menuTitle.isNotEmpty)
                TextSeparator(text: data.menuTitle),
            
              for (var option in data.options) ...[
                MenuItem(
                text: option.text,
                icon: option.icon,
                isSelected: option.isSelected,
                onPressed: () {
                  if (option.path != null) {
                    context.go(option.path!.path);
                  }
                }
              ),

              const SizedBox(height: 12),
              ]
            ],
          ],
        ),
      ),
    );
  }
}