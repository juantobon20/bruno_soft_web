import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/config.dart';
import 'di/dependencies_module.dart';
import 'presentation/presentation.dart';

void main() {
  setupLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getTheme(),
      home: Scaffold(
        body: BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: LoginScreen(),
      )),
    );
  }
}
