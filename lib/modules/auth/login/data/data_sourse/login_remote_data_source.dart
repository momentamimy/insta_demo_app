import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_demo_app/modules/auth/login/data/repository/login_repository.dart';

class LoginRemoteDataSource extends LoginRepository{


  @override
  Future<UserCredential>loginWithEmailAndPassword({required String email, required String password}) async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }

  @override
  loginWithGmail() {
    // TODO: implement loginWithGmail
    throw UnimplementedError();
  }
}