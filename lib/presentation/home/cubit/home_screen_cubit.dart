import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState());


  void setController(AnimationController animationController) {
    final movement = Tween<double>(begin: -250, end: 0)
      .animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    
    final opacity = Tween<double>(begin: 0, end: 1)
      .animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    emit(state.copyWith(
      animationController: animationController,
      movement: movement,
      opacity: opacity
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
