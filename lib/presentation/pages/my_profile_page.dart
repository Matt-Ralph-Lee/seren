import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seren/presentation/controllers/write/edit_username/edit_username_controller.dart';
import 'package:seren/presentation/controllers/write/sign_out/sign_out_controller.dart';

import '../shared/constants/page_path.dart';

class MyProfilePage extends ConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signOutState = ref.watch(signOutControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile Page",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: signOutState.isLoading
                ? null
                : () => ref.read(signOutControllerProvider.notifier).execute(),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => context.push(PagePath.calendar),
            child: const Text(
              "see all memories",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () => ref
                .read(editUsernameControllerProvider.notifier)
                .execute("usernameFuga"),
            child: const Text(
              "edit username",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
