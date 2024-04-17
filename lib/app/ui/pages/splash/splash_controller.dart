import 'package:flutter_meedu/meedu.dart';

import '../../../domain/repositories/authentication_repository.dart';
import '../../global/controller/session_controller.dart';
import '../../routes/routes.dart';

class SplashController extends SimpleNotifier {
  SplashController(this.sessionController) {
    _init();
  }
  final SessionController sessionController;
  final AuthenticationRepostiroy _authRepository = Get.find();

  String? _routeName;
  String get routeName => _routeName!;

  void _init() async {
    final user = await _authRepository.user;
    if (user != null) {
      sessionController.setUser(user);
      _routeName = Routes.home;
    } else {
      _routeName = Routes.login;
    }
    notify();
  }
}
