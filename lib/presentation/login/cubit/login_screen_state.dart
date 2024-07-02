part of 'login_screen_bloc.dart';

class LoginState extends Equatable {

  final bool isLoading;
  final String userName;
  final String? userNameError;
  final String password;
  final String? passwordError;
  final ErrorData? errorData;

  const LoginState({
    this.isLoading = false,
    this.userName = "",
    this.userNameError,
    this.password = "",
    this.passwordError,
    this.errorData
  });

  LoginState copyWith({
    bool? isLoading,
    String? userName,
    String? userNameError,
    String? password,
    String? passwordError,
    ErrorData? errorData
  }) => LoginState(
    isLoading: isLoading ?? this.isLoading,
    userName: userName ?? this.userName,
    userNameError: userNameError ?? this.userNameError,
    password: password ?? this.password,
    passwordError: passwordError ?? this.passwordError,
    errorData: errorData ?? this.errorData
  );

  @override
  List<Object> get props => [ isLoading, userName, password ];
}