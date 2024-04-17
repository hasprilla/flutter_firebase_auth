import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../global/controller/session_controller.dart';
import '../../../../routes/routes.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer(builder: (_, ref, __) {
            final user = ref.watch(sessionProvider).user!;
            return Text('Welcome ${user.displayName ?? ''}');
          }),
          const Text('Home Page'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await sessionProvider.read.signOut();
              router.pushReplacementNamed(Routes.login);
            },
            child: const Text('Sign Out'),
          )
        ],
      ),
    );
  }
}
