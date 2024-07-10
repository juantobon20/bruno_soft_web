import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/config.dart';
import '../../widgets/widgets.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState());


  void setController(AnimationController animationController) {
    final movement = Tween<double>(begin: -250, end: 0)
      .animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    
    final opacity = Tween<double>(begin: 0, end: 1)
      .animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    final options = [
      MenuTitleData(
        menuTitle: '', 
        options: [
          MenuData(icon: Icons.home_outlined, text: 'Inicio', isSelected: true, path: RouterPath.homeView),
          MenuData(icon: Icons.discount_outlined, text: 'Productos', isSelected: false),
          MenuData(icon: Icons.people_alt_outlined, text: 'Proveedores', isSelected: false),
          MenuData(icon: Icons.people_alt_outlined, text: 'Clientes', isSelected: false)
        ]
      ),
      MenuTitleData(
        menuTitle: 'Administración', 
        options: [
          MenuData(icon: Icons.people_alt_outlined, text: 'Usuarios', isSelected: false, path: RouterPath.usersView),
          MenuData(icon: Icons.security, text: 'Roles', isSelected: false)
        ]
      )
    ];

    emit(state.copyWith(
      animationController: animationController,
      movement: movement,
      opacity: opacity,
      options: options
    ));
  }

  void openMenu() {
    emit(state.copyWith(isOpen: true));

    if (state.animationController != null) {
      state.animationController!.forward();
    }
  }

  void closeMenu() {
    emit(state.copyWith(isOpen: false));

    if (state.animationController != null) {
      state.animationController!.reverse();
    }
  }

  void changeOption(String path) {
    final updatedOptions = state.options.map((item) => 
      item.copyWith(options: item.options.map((option) => 
        option.copyWith(isSelected: option.path?.name == path)).toList()
      )
    ).toList();

    emit(state.copyWith(
      options: updatedOptions
    ));
  }

  void toggleMenu() {
    if (state.animationController == null) {
      return;
    }

    if (state.isOpen) {
      state.animationController?.reverse();
    } else {
      state.animationController?.forward();
    }

    emit(state.copyWith(
      isOpen: !state.isOpen
    ));
  }
}
