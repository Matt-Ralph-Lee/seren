import 'package:seren/backend/model/chat.dart';
import 'package:seren/backend/model/chat_list.dart';
import 'package:seren/backend/model/property/chat_id.dart';
import 'package:seren/backend/repository/identity_repository.dart';

import '../model/last_message.dart';
import '../model/property/user_id.dart';
import 'database.dart';

class ChatListRepository {
  final db = Database.realtimeDatabase;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/chatList").set({"hasValue": false});
  }

  Stream<ChatList> getChatListStream(final UserId userId) {
    final identityRepository = IdentityRepository();

    final chatListDataStream = db
        .child("user/${userId.value}/chatList")
        .orderByChild("lastMessage/timestamp")
        .onValue;
    final streamToPublish = chatListDataStream.asyncMap((event) async {
      final chatListMap =
          Map<dynamic, dynamic>.from(event.snapshot.value as dynamic);

      final chatListData = chatListMap.entries.map((e) async {
        final chatId = ChatId(e.key);
        final lastMessage = LastMessage.fromRTDB(e.value["lastMessage"]);
        final partnerIconPath =
            await identityRepository.getUserIconPath(lastMessage.sentBy);
        final partnerName =
            await identityRepository.getUsername(lastMessage.sentBy);

        return Chat(
          chatId: chatId,
          partnerIconPath: partnerIconPath,
          partnerName: partnerName,
          lastMessage: lastMessage,
        );
      });

      final chatList = await Future.wait(chatListData);

      return ChatList(chatList);
    });

    return streamToPublish;
  }

  Future<ChatId?> getChatId({
    required final UserId userId,
    required final UserId partnerUserId,
  }) async {
    final event = await db
        .child("user/${userId.value}/chatList")
        .orderByChild("partner")
        .equalTo(partnerUserId.value)
        .once();
    if (event.snapshot.exists) {
      return ChatId(
          event.snapshot.children.first.child("partner").value as String);
    }
    return null;
  }

  Future<String> addChat({
    required final UserId userId,
    required final UserId partnerUserId,
  }) async {
    final ref = db.child("user/${userId.value}/chatList").push();
    final newKey = ref.key!;
    final initialChatData = {
      "timestamp": DateTime.now().millisecondsSinceEpoch,
      "message": "",
      "sentBy": userId.value,
      "seen": false,
    };
    await db.child("user").update({
      "${userId.value}/chatList/$newKey/lastMessage": initialChatData,
      "${userId.value}/chatList/$newKey/partner": partnerUserId.value,
      "${partnerUserId.value}/chatList/$newKey/lastMessage": initialChatData,
      "${partnerUserId.value}/chatList/$newKey/partner": userId.value,
    });
    return newKey;
  }
}
