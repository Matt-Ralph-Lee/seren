import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/write/sign_up/sign_up_controller.dart';
import '../shared/constants/page_path.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("sign up"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: signUpState.isLoading
                ? null
                : () {
                    ref
                        .read(signUpControllerProvider.notifier)
                        .execute("matthewralphlee@gmail.com", "hogehoge");
                  },
            child: const Text("Sign Up"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go(PagePath.signIn);
            },
            child: const Text("already have an account"),
          ),
          Visibility(
            visible: signUpState.hasError,
            child: Text("${signUpState.error}"),
          )
        ],
      ),
    );
  }
}
