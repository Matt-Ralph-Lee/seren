import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seren/presentation/controllers/read/get_user_icon/get_user_icon_controller.dart';

import '../../shared/constants/assets/asset_path.dart';

class UserIconWidget extends ConsumerWidget {
  const UserIconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIconDtoState = ref.watch(getUserIconControllerProvider);

    final body = userIconDtoState.when(
      data: (d) => IconButton(
        onPressed: () {},
        icon: CircleAvatar(
          backgroundImage: NetworkImage(d.path),
        ),
      ),
      error: (_, __) => IconButton(
        onPressed: () {},
        icon: const CircleAvatar(
          backgroundImage: AssetImage(AssetPath.defaultUserIcon),
        ),
      ),
      loading: () => const CircularProgressIndicator(),
    );

    return body;
  }
}
