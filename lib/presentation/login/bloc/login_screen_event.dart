part of 'login_screen_bloc.dart';

sealed class LoginEvent {}

class UserNameChangedEvent extends LoginEvent {
  final String userName;

  UserNameChangedEvent({required this.userName});
}

class PasswordChangedEvent extends LoginEvent {
  final String password;

  PasswordChangedEvent({required this.password});
}

class LoadingEvent extends LoginEvent {
  final LoadingEnum loading;

  LoadingEvent({required this.loading});
}

class ErrorEvent extends LoginEvent {
  final ErrorData errorData;

  ErrorEvent({required this.errorData});
}