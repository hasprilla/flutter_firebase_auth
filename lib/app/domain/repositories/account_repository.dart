import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AccountRepostiroy {
  Future<User> updateDusplayName(String value);
}
