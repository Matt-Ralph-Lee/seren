import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seren/presentation/controllers/read/get_chat_list/get_chat_list_controller.dart';
import 'package:seren/presentation/controllers/read/get_friend_count/get_friend_count_controller.dart';

import '../shared/constants/page_path.dart';

class ChatListPage extends ConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getFriendCountState = ref.watch(getFriendCountControllerProvider);
    final getChatListState = ref.watch(getChatListControllerProvider);

    final Widget body1 = getFriendCountState.when(
      data: (friendCount) => Text(
        "${friendCount.count}",
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
          ),
        ],
      ),
      loading: () => const CircularProgressIndicator(),
    );

    final Widget body2 = getChatListState.when(
      data: (chatList) => Expanded(
        child: ListView(
          children: [
            for (final chat in chatList)
              Column(
                children: [
                  Text(
                    chat.chatId,
                    style: const TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        context.push(PagePath.chatRoom(chatId: chat.chatId)),
                    child: const Text(
                      "to chat room",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
          ],
        ),
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
          "chat list page",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => context.go(PagePath.initial),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          body1,
          ElevatedButton(
            onPressed: () => context.push(PagePath.friendList),
            child: const Text(
              "friend list",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body2,
        ],
      ),
    );
  }
}
