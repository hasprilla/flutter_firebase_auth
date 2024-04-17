import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../global/controller/session_controller.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(sessionProvider).user!;
    return Container(child: Text('Welcome ${user.displayName ?? ''}'));
  }
}
