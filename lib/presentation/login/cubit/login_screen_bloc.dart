
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginEvent, LoginState> {

  final ValidationRouter _validationRouter;

  LoginScreenBloc({
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

    final validation = _validationRouter.validate(ValidationType.other, event.userName);
    final newLoginErrorState = state.loginErrorState.copyWith(
      userName: validation.messageError
    );

    emit(state.copyWith(
      userName: !validation.isValid ? event.userName : null,
      loginErrorState: newLoginErrorState
    ));
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<LoginState> emit) {
    _validationRouter.register(ValidationType.password, [
      EmptyValidationStrategy(),
      PasswordValidationStrategy()
    ]);

    final validation = _validationRouter.validate(ValidationType.password, event.password);

    emit(state.copyWith(
      password: !validation.isValid ? event.password : null,
      loginErrorState : state.loginErrorState.copyWith(
        password: validation.messageError
      )
    ));
  }

  void onUserNameChanged(String value) {
    add(UserNameChangedEvent(userName: value));
  }

  void onPasswordChanged(String value) {
    add(PasswordChangedEvent(password: value));
  }

  void onErrors() {
    add(PasswordChangedEvent(password: "asds"));
  }
}