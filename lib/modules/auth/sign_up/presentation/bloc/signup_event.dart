part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupWithEmailAndPassword extends SignupEvent {}

class SignupWithGmail extends SignupEvent {}
