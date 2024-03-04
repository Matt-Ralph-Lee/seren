import 'package:seren/backend/model/message_list.dart';
import 'package:seren/backend/model/property/message_text.dart';

import '../model/message.dart';
import '../model/property/chat_id.dart';
import '../model/property/user_id.dart';
import 'database.dart';

class MessageRepository {
  final db = Database.realtimeDatabase;

  Stream<MessageList> getMessageListStream({
    required final UserId userId,
    required final ChatId chatId,
  }) {
    final messageListDataStream =
        db.child("message/${chatId.value}").orderByKey().onValue;
    final streamToPublish = messageListDataStream.asyncMap((event) async {
      if (event.snapshot.exists) {
        final messageListData = <Message>[];
        for (final messageDataSnapshot in event.snapshot.children) {
          final messageDataMap =
              Map<dynamic, dynamic>.from(messageDataSnapshot.value as dynamic);
          final message = Message.fromRTDB(messageDataMap);
          if (message.sentBy != userId) {
            await db
                .child("message/${chatId.value}/${messageDataSnapshot.key}")
                .update({"seen": true});
            await db
                .child(
                    "user/${userId.value}/chatList/${chatId.value}/lastMessage")
                .update({"seen": true});
            await db
                .child(
                    "user/${message.sentBy.value}/chatList/${chatId.value}/lastMessage")
                .update({"seen": true});
          }
          messageListData.add(message);
        }
        return MessageList(messageListData);
      } else {
        return MessageList([]);
      }
    });

    return streamToPublish;
  }

  Future<UserId> getPartnerId({
    required final UserId userId,
    required final ChatId chatId,
  }) async {
    final event = await db
        .child("user/${userId.value}/chatList/${chatId.value}/partner")
        .once();
    final partnerIdData = event.snapshot.value as String?;
    if (partnerIdData == null) throw Exception("cannot find partnerId");
    return UserId(partnerIdData);
  }

  Future<void> addMessage({
    required final UserId userId,
    required final UserId partnerId,
    required final MessageText messageText,
    required final ChatId chatId,
  }) async {
    final newMessage = {
      "timestamp": DateTime.now().millisecondsSinceEpoch,
      "message": messageText.value,
      "sentBy": userId.value,
      "seen": false,
    };
    await db.child("message/${chatId.value}/").push().set(newMessage);
    await db.child("user").update({
      "${userId.value}/chatList/${chatId.value}/lastMessage": newMessage,
      "${partnerId.value}/chatList/${chatId.value}/lastMessage": newMessage,
    });
  }
}
