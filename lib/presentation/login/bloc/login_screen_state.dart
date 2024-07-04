part of 'login_screen_bloc.dart';

class LoginState extends Equatable {

  final LoadingEnum loading;
  final FieldData userName;
  final FieldData password;
  final bool isValid;
  final ErrorData? errorData;

  const LoginState({
    this.loading = LoadingEnum.init,
    this.userName = const FieldData(),
    this.password = const FieldData(),
    this.isValid = false,
    this.errorData
  });

  LoginState copyWith({
    LoadingEnum? loading,
    FieldData? userName,
    FieldData? password,
    bool? isValid,
    ErrorData? errorData
  }) => LoginState(
    loading: loading ?? this.loading,
    userName: userName ?? this.userName,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid,
    errorData: errorData
  );

  @override
  List<Object> get props => [ loading, userName, password, isValid ];
}