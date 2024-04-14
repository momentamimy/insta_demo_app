import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_demo_app/modules/auth/login/data/repository/login_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginBloc({required LoginRepository loginRepository})
      : _repository = loginRepository,
        super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginWithEmailAndPassword) {
        await _signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
            emit: emit);
      } else {
        emit(LoginInitial());
      }
    });
  }

  Future<void> _signInWithEmailAndPassword(
      {required String email,
      required String password,
      required Emitter<LoginState> emit}) async {
    emit(LoginLoading());
    try {
      final UserCredential userCredential =
          await _repository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess(user: userCredential));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          emit(LoginFailed(errorMessage: 'wrong email or password.'));
          break;
        case 'network-request-failed':
          emit(LoginFailed(
              errorMessage: 'Network error. Please check your connection.'));
          break;
        default:
          emit(LoginFailed(errorMessage: 'Error: ${e.message}'));
          break;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(LoginFailed(errorMessage: 'Error: $e'));
    }
  }
}
