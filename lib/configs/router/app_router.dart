import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../di/dependencies_module.dart';
import '../../presentation/presentation.dart';
import 'cubit/app_router_cubit.dart';

class AppRouter {

  GoRouter routes(AppRouterCubit routerCubit) {
    return GoRouter(
      initialLocation: RouterPath.splash.path,
      routes: [

        GoRoute(
          path: RouterPath.splash.path,
          builder: (_, __) => const SplashScreen()
        ),

        GoRoute(
          path: RouterPath.login.path,
          builder: (_, __) => BlocProvider(
            create: (context) => getIt<LoginScreenBloc>(),
            child: LoginScreen(),
          ),
        ),

        GoRoute(
          path: RouterPath.homeScreen.path,
          builder: (context, state) {
            final page = state.pathParameters['page'] ?? RouterPath.homeView.name;
            return HomeScreen(page: page) ;
          },
        ),

        GoRoute(
          path: '/',
          redirect: (_, __) => RouterPath.homeView.path,
        )
      ],
      redirect: (context, state) {
        final path = state.matchedLocation;
        final AuthStatus authStatus = routerCubit.state.authStatus;

        if (authStatus == AuthStatus.checking) {
          return RouterPath.splash.path;
        }

        if (authStatus == AuthStatus.notAuthenticated) {
          return RouterPath.login.path;
        }

        if (authStatus == AuthStatus.authenticated) {
          if (path == RouterPath.splash.path || path == RouterPath.login.path) {
            return RouterPath.homeView.path;
          }
        }

        return null;
      }
    );
  }
}

enum RouterPath {
  splash("splash", "/splash"),
  login("login", "/login"),
  homeScreen("home", "/:page"),
  homeView("home", "/home"),
  usersView("users", "/users"),
  rolesView("roles", "/roles");
  
  final String name;
  final String path;

  const RouterPath(this.name, this.path);
}