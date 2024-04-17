import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import '../../../../domain/inputs/sign_up.dart';
import '../../../../domain/repositories/sign_up_repository.dart';
import '../../../../domain/response/sign_up_response.dart';
import '../../../global/controller/session_controller.dart';
import 'register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final SessionController sessionController;
  RegisterController(this.sessionController)
      : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final SignUpRepository _signUpRepository = Get.find();

  Future<SignUpRespnse> submit() async {
    final response = await _signUpRepository.register(
      SignUpData(
        email: state.email,
        password: state.password,
        name: state.name,
        lastName: state.lastName,
      ),
    );

    if (response.error == null) {
      sessionController.setUser(response.user!);
    }

    return response;
  }

  void onNameChanged(String name) {
    state = state.copyWith(name: name);
  }

  void onLastNameChanged(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onVPasswordChanged(String vPassword) {
    state = state.copyWith(vPassword: vPassword);
  }
}
