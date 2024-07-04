import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginEvent, LoginState> {

  final ValidationRouter _validationRouter;
  final LoginUseCase _loginUseCase;
  final InsertAuthUsecase _insertAuthUsecase;

  final StreamController<bool> _authController = StreamController();
  Stream<bool> get authStatusStream => _authController.stream;

  LoginScreenBloc({
    required ValidationRouter validationRouter,
    required LoginUseCase loginUseCase,
    required InsertAuthUsecase insertAuthCase
  }) : _validationRouter = validationRouter, 
    _loginUseCase = loginUseCase,
    _insertAuthUsecase = insertAuthCase,
    super(const LoginState()) {
      on<UserNameChangedEvent>(_onUserNameChanged);
      on<PasswordChangedEvent>(_onPasswordChanged);
      on<LoadingEvent>(_onLoadingChanged);
      on<ErrorEvent>(_onErrorChanged);
      on<SuccessEvent>(_onSuccess);
    }
  
  void _onUserNameChanged(UserNameChangedEvent event, Emitter<LoginState> emit) {
    _validationRouter.register(ValidationType.other, [
      EmptyValidationStrategy(),
      MinimumValidationStrategy()
    ]);

    final ValidationResponse validation = _validationRouter.validate(ValidationType.other, event.userName);
    final FieldData userNameField = FieldData(
      text: event.userName,
      isValid: validation.isValid,
      error: validation.messageError
    );

    emit(state.copyWith(
      userName: userNameField,
      isValid: state.password.isValid && validation.isValid
    ));
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<LoginState> emit) {
    final MinimumValidationStrategy minimumValidationStrategy = MinimumValidationStrategy();
    minimumValidationStrategy.setMinimum(10);
    
    _validationRouter.register(ValidationType.password, [
      EmptyValidationStrategy(),
      minimumValidationStrategy
    ]);

    final validation = _validationRouter.validate(ValidationType.password, event.password);
    final FieldData passwordField = FieldData(
      text: event.password,
      isValid: validation.isValid,
      error: validation.messageError
    );

    emit(state.copyWith(
      password: passwordField,
      isValid: state.userName.isValid && validation.isValid
    ));
  }

  void _onLoadingChanged(LoadingEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      loading: event.loading,
      errorData: null
    ));
  }

  void _onErrorChanged(ErrorEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      errorData: event.errorData,
      loading: LoadingEnum.hide
    ));
  }

  void _onSuccess(SuccessEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      errorData: null,
      loading: LoadingEnum.hide,
      navigateToHome: true
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
      return;
    }

    add(LoadingEvent(loading: LoadingEnum.show));

    ServiceHelper.handleServiceCall(
      serviceCall: () async {
        final AuthData loginResponse = await _loginUseCase.login(
          userName: state.userName.text, 
          password: state.password.text
        );
        
        if (!loginResponse.user.state) {
          add(ErrorEvent(errorData: 
            ErrorData(
              type: ErrorType.otherError, 
              message: "El usuario se encuentra inactivo.\nPor favor validar con el administrador.",
              title: "Usuario inactivo"
            )
          ));
          return;
        }

        _insertAuthUsecase.insert(authData: loginResponse);
        _authController.add(true);
        add(SuccessEvent());
      }, 
      returnException: (error) {
        add(ErrorEvent(errorData: error));
      }
    );
  }
}