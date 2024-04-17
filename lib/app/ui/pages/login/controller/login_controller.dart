// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

import '../../../../domain/repositories/authentication_repository.dart';
import '../../../../domain/response/sign_in_response.dart';
import '../../../global/controller/session_controller.dart';

class LoginController extends SimpleNotifier {
  LoginController(this.sessionController);

  final SessionController sessionController;
  String _email = '';
  String _password = '';
  final AuthenticationRepostiroy _authRepository = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onEmailChanged(String value) {
    _email = value;
  }

  void onPasswordChanged(String value) {
    _password = value;
  }

  Future<SignInResponse> submit() async {
    final response = await _authRepository.signInWithEmailAndPassword(
      _email,
      _password,
    );
    if (response.error == null) {
      sessionController.setUser(response.user!);
    }
    return response;
  }
}
