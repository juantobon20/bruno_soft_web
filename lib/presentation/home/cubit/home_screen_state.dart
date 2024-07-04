part of 'home_screen_cubit.dart';

class HomeScreenState {

  final bool isOpen;
  final AnimationController? animationController;
  final Animation<double>? movement;
  final Animation<double>? opacity;
  

  const HomeScreenState({
    this.animationController,
    this.movement,
    this.opacity,
    this.isOpen = false,
  });

  HomeScreenState copyWith({
    bool? isOpen,
    AnimationController? animationController,
    Animation<double>? movement,
    Animation<double>? opacity
  }) => HomeScreenState(
    animationController: animationController ?? this.animationController,
    movement: movement ?? this.movement,
    opacity: opacity ?? this.opacity,
    isOpen: isOpen ?? this.isOpen
  );
}
