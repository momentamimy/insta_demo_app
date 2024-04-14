import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_demo_app/modules/auth/sign_up/data/repositories/sign_up_repository.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpRepository _repository;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  SignupBloc({required SignUpRepository signUpRepository})
      : _repository = signUpRepository,
        super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupWithEmailAndPassword) {
        await _signUpWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
            emit: emit);
      }else{
        emit(SignupInitial());
      }
    });
  }

  Future<void> _signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required Emitter<SignupState> emit}) async {
    try {
      final UserCredential user = await _repository.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignupSuccess(user: user));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          emit(SignupFailed(
              errorMessage: 'The account already exists for that email.'));
          break;
        case 'weak-password':
          emit(
              SignupFailed(errorMessage: 'The password provided is too weak.'));
          break;
        case 'network-request-failed':
          emit(SignupFailed(
              errorMessage: 'Network error. Please check your connection.'));
          break;
        default:
          print("_______________${e.code}");
          emit(SignupFailed(errorMessage: 'Error: ${e.message}'));
          break;
      }
    } catch (e) {
      print(e.toString());
      emit(SignupFailed(errorMessage: 'Error: $e'));
    }
  }
}
