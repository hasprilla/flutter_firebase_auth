import 'package:firebase_auth/firebase_auth.dart';

class SignInResponse {
  final SignInError? error;
  final User? user;
  SignInResponse(this.error, this.user);
}

enum SignInError {
  networkRequestFailed,
  tooManyRequests,
  userDisabled,
  userNotFound,
  wrongPassword,
  unknown
}

SignInError stringToSignInError(String error) {
  switch (error) {
    case 'network-request-failed':
      return SignInError.networkRequestFailed;
    case 'too-many-requests':
      return SignInError.tooManyRequests;
    case 'user-disabled':
      return SignInError.userDisabled;
    case 'user-not-found':
      return SignInError.userNotFound;
    case 'wrong-password':
      return SignInError.wrongPassword;
    case 'unknown':
      return SignInError.unknown;
    default:
      return SignInError.networkRequestFailed;
  }
}
