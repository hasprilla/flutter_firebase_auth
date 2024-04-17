import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../domain/response/sign_up_response.dart';
import '../../../global/dialogs/dialogs.dart';
import '../../../global/dialogs/progress_dialog.dart';
import '../../../routes/routes.dart';
import '../register_page.dart' show registerProvider;

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String content;
      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = 'The email is already in use';
          break;
        case SignUpError.weakPassword:
          content = 'The password is too weak';
          break;
        case SignUpError.networkRequestFailed:
          content = 'No internet connection';
          break;
        case SignUpError.tooManyRequests:
          content = 'Too many requests';
          break;
        case SignUpError.unknown:
          content = 'An unknown error has occurred';
          break;
        default:
          content = 'An unknown error has occurred';
          break;
      }
      Dialogs.alert(
        // ignore: use_build_context_synchronously
        context,
        title: 'Error',
        content: content,
        okText: 'Accept',
      );
    } else {
      router.pushReplacementNamed(Routes.home);
    }
  } else {
    Dialogs.alert(
      context,
      title: 'Error',
      content: 'Please, fill all the fields correctly',
      okText: 'Accept',
    );
  }
}
