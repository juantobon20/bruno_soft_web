import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'configs/config.dart';
import 'di/dependencies_module.dart';
import 'presentation/presentation.dart';

void main() {
  setupLocator();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => getIt<AppRouterCubit>()),
      BlocProvider(create: (_) => getIt<HomeScreenCubit>())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = AppRouter().routes(context.watch<AppRouterCubit>());

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: router,
      title: 'BrunoSoft',
    );
  }
}
