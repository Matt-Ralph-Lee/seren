import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shared/constants/page_path.dart';
import '../controllers/write/sign_in/sign_in_controller.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("sign in"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: signInState.isLoading
                ? null
                : () {
                    ref
                        .read(signInControllerProvider.notifier)
                        .execute("matthewralphlee@gmail.com", "hogehoge");
                  },
            child: const Text("Sign In"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go(PagePath.signUp);
            },
            child: const Text("create a new account"),
          ),
          Visibility(
            visible: signInState.hasError,
            child: Text("${signInState.error}"),
          )
        ],
      ),
    );
  }
}
