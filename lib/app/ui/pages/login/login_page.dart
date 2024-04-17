import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../utils/email_validator.dart';
import '../../global/controller/session_controller.dart';
import '../../global/widgets/custom_input_file.dart';
import '../../routes/routes.dart';
import 'controller/login_controller.dart';
import 'utils/send_login_form.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
);

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomInputField(
                        labelText: 'Email',
                        onChanged: controller.onEmailChanged,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          return isValidEmail(text!) ? null : 'Invalid email';
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomInputField(
                        labelText: 'Password',
                        onChanged: controller.onPasswordChanged,
                        isPassword: true,
                        validator: (text) {
                          return text!.trim().length >= 6
                              ? null
                              : 'Invalid password';
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () =>
                                router.pushNamed(Routes.resetPassword),
                            child: const Text('Forgot password?'),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: () => sendLoginForm(context),
                            child: const Text('Sign In'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => router.pushNamed(Routes.register),
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
