import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../../domain/response/reset_password_response.dart';
import '../../domain/response/sign_in_response.dart';

class AuthenticationRepostiroyImpl implements AuthenticationRepostiroy {
  AuthenticationRepostiroyImpl(this._auth) {
    _init();
  }

  final FirebaseAuth _auth;

  User? _user;

  final Completer<void> _completer = Completer();

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }

  void _init() {
    _auth.authStateChanges().listen((User? user) {
      if (!_completer.isCompleted) {
        _completer.complete();
      }
      _user = user;
    });
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }

  @override
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user!;
      return SignInResponse(null, user);
    } on FirebaseAuthException catch (e) {
      return SignInResponse(stringToSignInError(e.code), null);
    }
  }

  @override
  Future<ResetPasswordResponse> senResetPasswordLink(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return ResetPasswordResponse.ok;
    } on FirebaseAuthException catch (e) {
      return stringToResetPasswordResponse(e.code);
    }
  }
}
