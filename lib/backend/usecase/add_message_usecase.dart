import 'package:seren/backend/model/property/chat_id.dart';
import 'package:seren/backend/model/property/message_text.dart';
import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/message_repostitory.dart';

class AddMessageUsecase {
  AddMessageUsecase._internal();

  static final AddMessageUsecase _cache = AddMessageUsecase._internal();

  factory AddMessageUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String messageTextData,
    required final String chatIdData,
  }) async {
    final userId = UserId(uid);
    final messageText = MessageText(messageTextData);
    final chatId = ChatId(chatIdData);

    final messageRepository = MessageRepository();

    final partnerId =
        await messageRepository.getPartnerId(userId: userId, chatId: chatId);

    await messageRepository.addMessage(
        userId: userId,
        partnerId: partnerId,
        messageText: messageText,
        chatId: chatId);
  }
}
