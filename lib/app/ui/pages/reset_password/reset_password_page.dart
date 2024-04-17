import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../domain/response/reset_password_response.dart';
import '../../../utils/email_validator.dart';
import '../../global/dialogs/dialogs.dart';
import '../../global/dialogs/progress_dialog.dart';
import '../../global/widgets/custom_input_file.dart';
import 'controller/reset_password_controller.dart';

final resetPasswordProvider = SimpleProvider(
  (_) => ResetPasswordController(),
);

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<ResetPasswordController>(
      provider: resetPasswordProvider,
      builder: (_, controller) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomInputField(
                    labelText: 'Email',
                    onChanged: controller.onEmailChanged,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ElevatedButton(
                    onPressed: () => _submit(context),
                    child: const Text('Send'),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context) async {
    final controller = resetPasswordProvider.read;
    if (isValidEmail(controller.email)) {
      ProgressDialog.show(context);
      final response = await controller.submit();

      Navigator.pop(context);
      if (response == ResetPasswordResponse.ok) {
        Dialogs.alert(
          context,
          title: 'Success',
          content: 'Check your email',
          okText: 'Accept',
        );
      } else {
        late String errorMessage;

        switch (response) {
          case ResetPasswordResponse.ok:
            errorMessage = 'Check your email';
            break;
          case ResetPasswordResponse.networkRequestFailed:
            errorMessage = 'Network request failed';
            break;

          case ResetPasswordResponse.userDisabled:
            errorMessage = 'The user is disabled';
            break;

          case ResetPasswordResponse.userNotFound:
            errorMessage = 'The user does not exist';
            break;

          case ResetPasswordResponse.tooManyRequests:
            errorMessage = 'Too many requests';
            break;

          case ResetPasswordResponse.unknown:
            errorMessage = 'An unknown error has occurred';
            break;
        }

        Dialogs.alert(
          context,
          title: 'Error',
          content: errorMessage,
          okText: 'Accept',
        );
      }
    } else {
      Dialogs.alert(
        context,
        title: 'Error',
        content: 'Invalid email',
        okText: 'Accept',
      );
    }
  }
}
