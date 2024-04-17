import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';

import 'data/repositories_impl/account_repository_impl.dart';
import 'data/repositories_impl/authentication_repository_impl.dart';
import 'data/repositories_impl/sign_up_repository.dart';
import 'domain/repositories/account_repository.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/repositories/sign_up_repository.dart';

void injectDependecies() {
  final firebaseAuthInstance = FirebaseAuth.instance;

  Get.lazyPut<AuthenticationRepostiroy>(
    () => AuthenticationRepostiroyImpl(firebaseAuthInstance),
  );
  Get.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(firebaseAuthInstance),
  );
  Get.lazyPut<AccountRepostiroy>(
    () => AccountRepostiroyImpl(firebaseAuthInstance),
  );
}
