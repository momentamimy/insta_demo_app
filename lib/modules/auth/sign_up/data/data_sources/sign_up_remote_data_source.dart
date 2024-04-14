import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_demo_app/modules/auth/sign_up/data/repositories/sign_up_repository.dart';

class SignupRemoteDataSource extends SignUpRepository{

  @override
  Future<UserCredential>signUpWithEmailAndPassword({required String email, required String password}) async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return user;
  }

  @override
  signUpWithGmail() {
    // TODO: implement signUpWithGmail
    throw UnimplementedError();
  }
}