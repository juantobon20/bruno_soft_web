part of 'login_screen_bloc.dart';

class LoginState extends Equatable {

  final bool isLoading;
  final String userName;
  final String password;
  final bool isValid;
  final LoginErrorState loginErrorState;
  final ErrorData? errorData;

  const LoginState({
    this.isLoading = false,
    this.userName = "",
    this.password = "",
    this.isValid = false,
    this.errorData,
    this.loginErrorState = const LoginErrorState()
  });

  LoginState copyWith({
    bool? isLoading,
    String? userName,
    String? password,
    bool? isValid,
    ErrorData? errorData,
    LoginErrorState? loginErrorState
  }) => LoginState(
    isLoading: isLoading ?? this.isLoading,
    userName: userName ?? this.userName,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid,
    errorData: errorData ?? this.errorData,
    loginErrorState: loginErrorState ?? this.loginErrorState,
  );

  @override
  List<Object> get props => [ isLoading, userName, password, isValid, loginErrorState ];
}

class LoginErrorState {
  final String? userName;
  final String? password;

  const LoginErrorState({
    this.userName,
    this.password
  });

  LoginErrorState copyWith({
    String? userName,
    String? password
  }) => LoginErrorState(
    userName: userName,
    password: password
  );
}