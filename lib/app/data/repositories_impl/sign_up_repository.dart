import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/inputs/sign_up.dart';
import '../../domain/repositories/sign_up_repository.dart';
import '../../domain/response/sign_up_response.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  SignUpRepositoryImpl(this._auth);

  final FirebaseAuth _auth;

  @override
  Future<SignUpRespnse> register(SignUpData data) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: data.email, password: data.password);
      await userCredential.user!
          .updateDisplayName('${data.name} ${data.lastName}');
      return SignUpRespnse(null, userCredential.user);
    } on FirebaseAuthException catch (e) {
      return SignUpRespnse(parseStingToSignUpError(e.code), null);
    }
  }
}
