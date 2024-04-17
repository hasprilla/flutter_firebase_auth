import 'package:firebase_auth/firebase_auth.dart';

parseStingToSignUpError(String error) {
  switch (error) {
    case 'email-already-in-use':
      return SignUpError.emailAlreadyInUse;
    case 'weak-password':
      return SignUpError.weakPassword;
    case 'network-request-failed':
      return SignUpError.networkRequestFailed;
    case 'too-many-requests':
      return SignUpError.tooManyRequests;
    default:
      return SignUpError.unknown;
  }
}

class SignUpRespnse {
  final SignUpError? error;
  final User? user;

  SignUpRespnse(this.error, this.user);
}

enum SignUpError {
  emailAlreadyInUse,
  weakPassword,
  networkRequestFailed,
  tooManyRequests,
  unknown
}
