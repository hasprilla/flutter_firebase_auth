import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../domain/response/sign_in_response.dart';
import '../../../global/dialogs/dialogs.dart';
import '../../../global/dialogs/progress_dialog.dart';
import '../../../routes/routes.dart';
import '../login_page.dart';

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String errorMessage;
      switch (response.error) {
        case SignInError.networkRequestFailed:
          errorMessage = 'Network request failed';
          break;
        case SignInError.tooManyRequests:
          errorMessage = 'Too many requests';
          break;
        case SignInError.userDisabled:
          errorMessage = 'The user is disabled';
          break;
        case SignInError.userNotFound:
          errorMessage = 'The user does not exist';
          break;
        case SignInError.wrongPassword:
          errorMessage = 'The password is wrong';
          break;
        case SignInError.unknown:
          errorMessage = 'An unknown error has occurred';
          break;

        default:
          errorMessage = 'An unknown error has occurred';
          break;
      }

      Dialogs.alert(
        // ignore: use_build_context_synchronously
        context,
        title: 'Error',
        content: errorMessage,
        okText: 'Accept',
      );
    } else {
      router.pushReplacementNamed(Routes.home);
    }
  }
}
