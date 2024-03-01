import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seren/presentation/controllers/read/get_profile/get_profile_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    super.key,
    required this.targetUid,
  });

  final String targetUid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProfileState = ref.watch(getProfileControllerProvider(targetUid));

    final Widget body = getProfileState.when(
      data: (profile) => Text(
        profile.username,
        style: const TextStyle(color: Colors.white),
      ),
      error: (e, s) => Column(
        children: [
          Text(
            "$e",
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            "$s",
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
      loading: () => const CircularProgressIndicator(),
    );

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Profile Page",
        style: TextStyle(color: Colors.white),
      )),
      body: body,
    );
  }
}
