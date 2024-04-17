import 'package:firebase_auth/firebase_auth.dart';

import '../response/reset_password_response.dart';
import '../response/sign_in_response.dart';

abstract interface class AuthenticationRepostiroy {
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<ResetPasswordResponse> senResetPasswordLink(String email);
}
