part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable {

  final bool isOpen;
  final AnimationController? animationController;
  final Animation<double>? movement;
  final Animation<double>? opacity;
  final List<MenuTitleData> options;
  

  const HomeScreenState({
    this.animationController,
    this.movement,
    this.opacity,
    this.isOpen = false,
    this.options = const []
  });

  HomeScreenState copyWith({
    bool? isOpen,
    AnimationController? animationController,
    Animation<double>? movement,
    Animation<double>? opacity,
    List<MenuTitleData>? options
  }) => HomeScreenState(
    animationController: animationController ?? this.animationController,
    movement: movement ?? this.movement,
    opacity: opacity ?? this.opacity,
    isOpen: isOpen ?? this.isOpen,
    options: options ?? this.options
  );

  @override
  List<Object> get props => [isOpen, options];
}
