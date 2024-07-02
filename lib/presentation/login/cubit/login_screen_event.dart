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
  final bool isLoading;

  LoadingEvent({required this.isLoading});
}

class SubmitEvent extends LoginEvent {}