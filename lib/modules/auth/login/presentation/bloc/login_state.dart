part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserCredential user;

  LoginSuccess({required this.user});
}

class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed({required this.errorMessage});
}
