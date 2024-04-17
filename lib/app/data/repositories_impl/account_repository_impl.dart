// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/account_repository.dart';

class AccountRepostiroyImpl implements AccountRepostiroy {
  AccountRepostiroyImpl(this._auth);

  final FirebaseAuth _auth;

  @override
  Future<User> updateDusplayName(String value) async {
    final user = _auth.currentUser;
    assert(user != null);

    await user!.updateDisplayName(value);

    return user;
  }
}
