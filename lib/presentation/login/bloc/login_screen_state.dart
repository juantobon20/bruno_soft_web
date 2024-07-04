part of 'login_screen_bloc.dart';

class LoginState extends Equatable {

  final LoadingEnum loading;
  final FieldData userName;
  final FieldData password;
  final bool isValid;
  final ErrorData? errorData;
  final bool navigateToHome;

  const LoginState({
    this.loading = LoadingEnum.init,
    this.userName = const FieldData(),
    this.password = const FieldData(),
    this.isValid = false,
    this.errorData,
    this.navigateToHome = false
  });

  LoginState copyWith({
    LoadingEnum? loading,
    FieldData? userName,
    FieldData? password,
    bool? isValid,
    ErrorData? errorData,
    bool? navigateToHome
  }) => LoginState(
    loading: loading ?? this.loading,
    userName: userName ?? this.userName,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid,
    errorData: errorData,
    navigateToHome: navigateToHome ?? this.navigateToHome
  );

  @override
  List<Object> get props => [ loading, userName, password, isValid, navigateToHome ];
}