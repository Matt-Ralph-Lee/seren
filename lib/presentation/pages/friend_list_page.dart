import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seren/presentation/controllers/read/get_friend_list/get_friend_list_controller.dart';

import '../shared/constants/page_path.dart';

class FriendListPage extends ConsumerWidget {
  const FriendListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getFriendListState = ref.watch(getFriendListControllerProvider);

    final Widget body = getFriendListState.when(
      data: (friendList) => ListView(
        children: [
          for (final friend in friendList)
            Column(
              children: [
                Text(
                  friend.friendName,
                  style: const TextStyle(color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.push(PagePath.profile(targetUid: friend.uid)),
                  child: const Text(
                    "to profile",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
        ],
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
          ),
        ],
      ),
      loading: () => const CircularProgressIndicator(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "friend list",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => context.go(PagePath.chatList),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
        ),
      ),
      body: body,
    );
  }
}
