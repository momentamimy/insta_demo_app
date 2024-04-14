import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<UserCredential> loginWithEmailAndPassword(
      {required String email, required String password});

  loginWithGmail();
}
