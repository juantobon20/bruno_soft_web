import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../di/dependencies_module.dart';
import '../../presentation/presentation.dart';
import 'cubit/app_router_cubit.dart';

class AppRouter {

  GoRouter routes(AppRouterCubit routerCubit) {
    return GoRouter(
      initialLocation: splashPath,
      routes: [

        GoRoute(
          path: splashPath,
          builder: (_, __) => SplashScreen()
        ),

        GoRoute(
          path: loginPath,
          builder: (_, __) => BlocProvider(
            create: (context) => getIt<LoginScreenBloc>(),
            child: LoginScreen(),
          ),
        ),

        GoRoute(
          path: homePath,
          builder: (_, __) => HomeScreen()
        )
        
        /*GoRoute(
            path: homePath,
            builder: (_, __) => BlocProvider(
                  create: (context) => HomeCubit(
                    pokemonRepository: pokemonRepository
                  ),
                  child: const HomeScreen(),
                ),
            routes: [
              GoRoute(
                  path: pokemonDetailPath,
                  builder: (_, state) {
                    final pokemonId = int.tryParse(state.params['id'] ?? '-1') ?? -1;
                    return BlocProvider(
                      create: (_) => PokemonDetailScreenCubit(
                        pokemonRepository: pokemonRepository
                      ),
                      child: PokemonDetailScreen(pokemonId: pokemonId),
                    );
                  }),
            ]),
        GoRoute(
          path: '/',
          redirect: (_, __) => '/home',
        )*/
      ],
      redirect: (context, state) {
        final isGoingTo = state.fullPath;
        final AuthStatus authStatus = routerCubit.state.authStatus;

        if (authStatus == AuthStatus.checking) {
          return splashPath;
        }

        if (authStatus == AuthStatus.notAuthenticated) {
          return loginPath;
        }

        if (authStatus == AuthStatus.authenticated) {
          return homePath;
        }

        return null;
      },
    );
  }
}

const splashPath = '/';
const loginPath = '/login';
const homePath = '/home';
const pokemonDetailPath = 'pokemon_detail/:id';

const homeViewPath = "home";
const favoriteViewPath = "favorites";