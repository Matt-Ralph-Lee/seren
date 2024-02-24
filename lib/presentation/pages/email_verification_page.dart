import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/write/sign_out/sign_out_controller.dart';
import '../shared/constants/page_path.dart';

class EmailVerificationPage extends ConsumerWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useOnAppLifecycleStateChange((previous, current) async {
    //   if (current == AppLifecycleState.resumed) {
    //     FirebaseAuth.instance.currentUser!.reload();
    //   }
    // });
    final signOutState = ref.watch(signOutControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("email verification"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("resend email"),
          ),
          ElevatedButton(
            onPressed: signOutState.isLoading
                ? null
                : () {
                    ref.read(signOutControllerProvider.notifier).execute();
                    context.go(PagePath.signUp);
                  },
            child: const Text("try other email"),
          ),
          ElevatedButton(
            onPressed: () async {
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                user.reload().then((value) {
                  user = FirebaseAuth.instance.currentUser;
                  if (user!.emailVerified) {
                    context.go(PagePath.initialUserSetting);
                  }
                });
              }
            },
            child: const Text("set user identity"),
          )
        ],
      ),
    );
  }
}
