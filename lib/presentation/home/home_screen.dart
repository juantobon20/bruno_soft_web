import 'package:bruno_soft_web/presentation/widgets/custom_menu/menu_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/config.dart';
import '../widgets/widgets.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final options = [
  MenuData(icon: Icons.home_outlined, text: 'Inicio', isActive: true),
  MenuData(icon: Icons.discount_outlined, text: 'Productos', isActive: false),
  MenuData(icon: Icons.people_alt_outlined, text: 'Proveedores', isActive: false),
  MenuData(icon: Icons.people_alt_outlined, text: 'Clientes', isActive: false),
  MenuData(icon: Icons.people_alt_outlined, text: 'Usuarios', isActive: false),
];

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    final controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    final cubit = context.read<HomeScreenCubit>();
    if (cubit.state.animationController == null) {
      cubit.setController(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      SideBar(options: options),

                    Expanded(
                      child: Column(
                        children: [
                          const NavBar(),
                          //View
                          Expanded(
                              child: Container(
                            child: Center(
                                child: Column(
                              children: [
                                PrimaryButton(
                                  text: "Hola",
                                  onPressedCallback: () {},
                                ),
                                SeconadyButton(
                                  text: "Hola",
                                  onPressedCallback: () {},
                                ),
                                TertiaryButton(
                                  text: "Hola",
                                  onPressedCallback: () {},
                                ),
                                CustomTextField(
                                  labelText: "Esto es una prueba",
                                ),
                                CustomPasswordTextField(
                                  labelText: "Esto es una prueba",
                                ),
                                titleText(text: "Prueba1"),
                                primaryText(text: "Prueba1"),
                                secondaryText(text: "Prueba1"),
                                tertiaryText(text: "Prueba1"),
                              ],
                            )),
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
                            child: SideBar(options: options),
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
}
