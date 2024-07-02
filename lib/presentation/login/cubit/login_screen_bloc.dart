import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final ValidationRouter _validationRouter;

  LoginBloc({
    required ValidationRouter validationRouter
  }) : _validationRouter = validationRouter, 
    super(const LoginState()) {
      on<UserNameChangedEvent>(_onUserNameChanged);
      on<PasswordChangedEvent>(_onPasswordChanged);
    }
  
  void _onUserNameChanged(UserNameChangedEvent event, Emitter<LoginState> emit) {
    _validationRouter.register(ValidationType.other, [
      EmptyValidationStrategy(),
      MinimumValidationStrategy()
    ]);

    final validation = _validationRouter.validate(ValidationType.email, event.userName);

    emit(state.copyWith(
      userName: event.userName,
      userNameError: validation
    ));
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<LoginState> emit) {
    _validationRouter.register(ValidationType.other, [
      EmptyValidationStrategy(),
      MinimumValidationStrategy(),
      PasswordValidationStrategy()
    ]);

    final validation = _validationRouter.validate(ValidationType.email, event.password);

    emit(state.copyWith(
      password: event.password,
      passwordError: validation
    ));
  }

  void onUserNameChanged(String value) {
    add(UserNameChangedEvent(userName: value));
  }

  void onPasswordChanged(String value) {
    add(PasswordChangedEvent(password: value));
  }
}