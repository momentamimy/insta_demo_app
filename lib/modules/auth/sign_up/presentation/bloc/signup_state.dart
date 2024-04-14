part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserCredential user;

  SignupSuccess({required this.user});
}

class SignupFailed extends SignupState {
  final String errorMessage;

  SignupFailed({required this.errorMessage});
}
