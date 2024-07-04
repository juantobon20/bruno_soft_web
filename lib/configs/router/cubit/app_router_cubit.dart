import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../../presentation/presentation.dart';

part 'app_router_state.dart';

class AppRouterCubit extends Cubit<AppRouterState> with ChangeNotifier {

  final IsLoggedInUsecase _isLoggedInUsecase;
  
  AppRouterCubit({
    required IsLoggedInUsecase isLoggedInUsecase,
    required LoginScreenBloc loginScreenBloc
  }) : _isLoggedInUsecase = isLoggedInUsecase,
    super(const AppRouterState()) {
      loginScreenBloc.authStatusStream.listen((isLogged) {
        if (isLogged) {
          emit(state.copyWith(authStatus: AuthStatus.authenticated));
        }
        });
        checkAuthStatus();
    }

  void checkAuthStatus() async {
    final bool isAuthenticated = await _isLoggedInUsecase.isLoggedIn();
    late AuthStatus authStatus;
    if (isAuthenticated) {
      authStatus = AuthStatus.authenticated;
    } else {
      authStatus = AuthStatus.notAuthenticated;
    }

    emit(
      state.copyWith(
        authStatus: authStatus
      )
    );
  }

  void logOut() async {
    //await _userRepository.saveLoggedIn(false);

    checkAuthStatus();
  }
}