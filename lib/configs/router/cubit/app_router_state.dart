part of 'app_router_cubit.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }
class AppRouterState extends Equatable {

  final AuthStatus authStatus;
  const AppRouterState({
    this.authStatus = AuthStatus.checking
  });

  AppRouterState copyWith({
    AuthStatus? authStatus
  }) => AppRouterState(
    authStatus: authStatus ?? this.authStatus
  );

  @override
  List<Object?> get props => [authStatus];
}
