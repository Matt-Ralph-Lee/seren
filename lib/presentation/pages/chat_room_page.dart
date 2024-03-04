import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seren/presentation/controllers/read/get_friend/get_friend_controller.dart';
import 'package:seren/presentation/controllers/read/get_message_list/get_message_list_controller.dart';
import 'package:seren/presentation/controllers/write/add_message/add_message_controller.dart';

import '../shared/constants/page_path.dart';

class ChatRoomPage extends ConsumerWidget {
  const ChatRoomPage({
    super.key,
    required this.chatId,
  });

  final String chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getFriendIdentityState = ref.watch(getFriendControllerProvider);
    final getMessageListState =
        ref.watch(getMessageListControllerProvider(chatId));

    final pageTitle = getFriendIdentityState.when(
      data: (friend) => Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(friend.friendIconPath),
          ),
          Text(
            friend.friendName,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      error: (e, s) => Text(
        "$e",
        style: const TextStyle(color: Colors.white),
      ),
      loading: () => const CircularProgressIndicator(),
    );

    final Widget body = getMessageListState.when(
      data: (messageList) => Expanded(
        child: ListView.builder(
          reverse: true,
          itemCount: messageList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                messageList[index].messageText,
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
      error: (e, s) => SingleChildScrollView(
        child: Column(
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
      ),
      loading: () => const CircularProgressIndicator(),
    );
    return Scaffold(
      appBar: AppBar(
        title: pageTitle,
        leading: IconButton(
          onPressed: () => context.go(PagePath.chatList),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          body,
          ElevatedButton(
            onPressed: () {
              ref.read(addMessageControllerProvider.notifier).execute(
                  messageTextData: DateTime.now().toIso8601String(),
                  chatIdData: chatId);
            },
            child: const Text(
              "add message",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
