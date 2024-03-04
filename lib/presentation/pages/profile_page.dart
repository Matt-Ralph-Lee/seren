import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seren/presentation/controllers/read/get_chat_id/get_chat_id_controller.dart';
import 'package:seren/presentation/controllers/read/get_profile/get_profile_controller.dart';
import 'package:seren/presentation/controllers/write/add_chat/add_chat_controller.dart';

import '../shared/constants/page_path.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    super.key,
    required this.targetUid,
  });

  final String targetUid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProfileState = ref.watch(getProfileControllerProvider(targetUid));
    final addChatState = ref.watch(addChatControllerProvider);

    final Widget body = getProfileState.when(
      data: (profile) => SingleChildScrollView(
        child: Column(
          children: [
            Text(
              profile.username,
              style: const TextStyle(color: Colors.white),
            ),
            Visibility(
              visible: profile.isFriend,
              child: ElevatedButton(
                onPressed: () async {
                  ref
                      .read(getChatIdControllerProvider.notifier)
                      .execute(targetUid)
                      .then((chatId) {
                    if (chatId.exists) {
                      context.go(PagePath.chatRoom(chatId: chatId.value));
                    } else {
                      ref
                          .read(addChatControllerProvider.notifier)
                          .execute(targetUid)
                          .then((chatId) {
                        if (chatId.exists) {
                          context.go(PagePath.chatRoom(chatId: chatId.value));
                          return;
                        }
                      });
                    }
                  });
                },
                child: const Text(
                  "message",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Visibility(
              visible: addChatState.hasError,
              child: Column(
                children: [
                  Text(
                    addChatState.error.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    addChatState.stackTrace.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
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
