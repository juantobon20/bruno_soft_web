
import 'package:bruno_soft_web/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginEvent, LoginState> {

  final ValidationRouter _validationRouter;
  final LoginUseCase _loginUseCase;

  LoginScreenBloc({
    required ValidationRouter validationRouter,
    required LoginUseCase loginUseCase
  }) : _validationRouter = validationRouter, 
    _loginUseCase = loginUseCase,
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
  
    emit(state.copyWith(
      userName: event.userName,
      loginErrorState: state.loginErrorState.copyWithUser(
        userName: validation.messageError
      ),
      isValid: state.isValid && validation.isValid
    ));
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<LoginState> emit) {
    _validationRouter.register(ValidationType.password, [
      EmptyValidationStrategy(),
      PasswordValidationStrategy()
    ]);

    final validation = _validationRouter.validate(ValidationType.password, event.password);

    emit(state.copyWith(
      password: event.password,
      loginErrorState : state.loginErrorState.copyWithPassword(
        password: validation.messageError
      ),
      isValid: state.isValid && validation.isValid
    ));
  }

  void onUserNameChanged(String value) {
    add(UserNameChangedEvent(userName: value));
  }

  void onPasswordChanged(String value) {
    add(PasswordChangedEvent(password: value));
  }

  void onSubmit() {
    if (!state.isValid) {

    }
  }
}