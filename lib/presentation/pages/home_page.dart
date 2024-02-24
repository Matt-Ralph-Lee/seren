import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/constants/l10n/get_app_localizations.dart';
import '../controllers/write/sign_out/sign_out_controller.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signOutState = ref.watch(signOutControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
        actions: [
          IconButton(
            onPressed: signOutState.isLoading
                ? null
                : () async {
                    ref.read(signOutControllerProvider.notifier).execute();
                  },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Text(getAppLocalizations(context).message.toString()),
        ],
      ),
    );
  }
}
