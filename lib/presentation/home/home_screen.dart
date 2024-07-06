import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/config.dart';
import '../../di/dependencies_module.dart';
import '../../domain/domain.dart';
import '../widgets/widgets.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {

  final String page;
  const HomeScreen({
    super.key,
    required this.page
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late HomeScreenCubit homeScreenCubit;
  
  @override
  void initState() {
    super.initState();

    final controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    homeScreenCubit = context.read<HomeScreenCubit>();
    if (homeScreenCubit.state.animationController == null) {
      homeScreenCubit.setController(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    homeScreenCubit.changeOption(widget.page);
    final Size size = MediaQuery.sizeOf(context);
    final isMobile = context.isMobileDesign();

    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CustomColors.background,
          body: SafeArea(
            child: Stack(
              children: [
                Row(
                  children: [
                    if (!isMobile) 
                      SideBar(options: state.options),

                    Expanded(
                      child: Column(
                        children: [
                          const NavBar(),
                          //View
                          Expanded(child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: _getChildByPage(context, widget.page),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
                if (isMobile)
                  AnimatedBuilder(
                    animation: state.animationController!,
                    builder: (context, _) => Stack(
                      children: [
                        if (state.isOpen)
                          Opacity(
                            opacity: state.opacity!.value,
                            child: GestureDetector(
                              onTap: () => context.read<HomeScreenCubit>().closeMenu(),
                              child: Container(
                                width: size.width,
                                height: size.height,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        
                        if (state.movement != null)
                          Transform.translate(
                            offset: Offset(state.movement!.value, 0),
                            child: SideBar(options: state.options),
                          )
                      ]
                    )
                  )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getChildByPage(BuildContext context, String page) {
    final isMobile = context.isMobileDesign();

    RouterPath? selectedRoute;
    for (var route in RouterPath.values) {
      if (route.name == page) {
        selectedRoute = route;
        break;
      }
    }

    if (selectedRoute == null) {
      return const HomePage();
    }

    switch (selectedRoute) {
      case RouterPath.usersView:
        Widget page;
        if (isMobile) {
          page = const UserPageMobile();
        } else {
          page = UserPageDesktop();
        }

        return BlocProvider(
          create: (_) => UsersViewCubit(getUsersUseCase: getIt<GetUsersUseCase>()),
          child: page,
        );
      default:
        return const HomePage();
    }
  }
}
