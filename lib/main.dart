import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/config.dart';
import 'di/dependencies_module.dart';

void main() {
  setupLocator();

  runApp(BlocProvider(
    create: (context) => getIt<AppRouterCubit>(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().routes(context.watch<AppRouterCubit>()),
      title: 'BrunoSoft',
      theme: AppTheme().getTheme(),
    );
  }
}
