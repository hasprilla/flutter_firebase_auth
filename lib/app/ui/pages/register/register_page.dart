import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../utils/email_validator.dart';
import '../../../utils/name_validator.dart';
import '../../global/controller/session_controller.dart';
import '../../global/widgets/custom_input_file.dart';
import 'controller/register_controller.dart';
import 'controller/register_state.dart';
import 'utils/send_register_form.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(
    sessionProvider.read,
  ),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(15),
                  children: [
                    CustomInputField(
                      labelText: 'Name',
                      onChanged: controller.onNameChanged,
                      validator: (text) {
                        return isValidName(text!) ? null : 'Invalid name';
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInputField(
                      labelText: 'Last Name',
                      onChanged: controller.onLastNameChanged,
                      validator: (text) {
                        return isValidName(text!) ? null : 'Invalid name';
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInputField(
                      labelText: 'Email',
                      onChanged: controller.onEmailChanged,
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        return isValidEmail(text!) ? null : 'Invalid email';
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInputField(
                      labelText: 'Password',
                      onChanged: controller.onPasswordChanged,
                      isPassword: true,
                      validator: (text) {
                        if (text!.trim().length >= 6) {
                          return null;
                        }
                        return 'Invalid password';
                      },
                    ),
                    const SizedBox(height: 15),
                    Consumer(builder: (_, ref, __) {
                      ref.watch(registerProvider.select((_) => _.password));
                      return CustomInputField(
                        labelText: 'Confirm Password',
                        onChanged: controller.onVPasswordChanged,
                        isPassword: true,
                        validator: (text) {
                          if (controller.state.password != text) {
                            return 'Passwords do not match';
                          }
                          if (text!.trim().length >= 6) {
                            return null;
                          }

                          return 'Invalid password';
                        },
                      );
                    }),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => sendRegisterForm(context),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
