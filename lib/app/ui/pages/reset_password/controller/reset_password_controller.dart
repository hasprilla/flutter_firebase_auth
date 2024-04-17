import 'package:flutter_meedu/meedu.dart';

import '../../../../domain/repositories/authentication_repository.dart';
import '../../../../domain/response/reset_password_response.dart';

class ResetPasswordController extends SimpleNotifier {
  String _email = '';
  String get email => _email;

  final _auth = Get.find<AuthenticationRepostiroy>();

  void onEmailChanged(String value) {
    _email = value;
  }

  Future<ResetPasswordResponse> submit() {
    return _auth.senResetPasswordLink(email);
  }
}
