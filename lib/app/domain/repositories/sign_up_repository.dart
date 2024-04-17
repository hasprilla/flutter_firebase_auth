import '../inputs/sign_up.dart';
import '../response/sign_up_response.dart';

abstract interface class SignUpRepository {
  Future<SignUpRespnse> register(SignUpData data);
}
