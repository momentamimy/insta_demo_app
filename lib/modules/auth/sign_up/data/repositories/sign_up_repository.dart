import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepository{
  Future<UserCredential>signUpWithEmailAndPassword({required String email,required String password});
  signUpWithGmail();
}