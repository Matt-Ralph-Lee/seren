import 'package:seren/backend/model/property/chat_id.dart';
import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/message_repostitory.dart';
import 'package:seren/dto/message_dto.dart';
import 'package:seren/dto/message_list_dto.dart';

class GetMessageListUsecase {
  GetMessageListUsecase._internal();

  static final GetMessageListUsecase _cache = GetMessageListUsecase._internal();

  factory GetMessageListUsecase() => _cache;

  Stream<MessageListDto> execute({
    required final String uid,
    required final String chatIdData,
  }) {
    final userId = UserId(uid);
    final chatId = ChatId(chatIdData);

    final messageRepository = MessageRepository();

    final messageListStream = messageRepository.getMessageListStream(
      userId: userId,
      chatId: chatId,
    );

    final streamToPublish = messageListStream.map((messageList) {
      final messageListDto = MessageListDto(messageList.map((message) {
        final messageDto = MessageDto(
          messageText: message.messageText.value,
          sentBy: message.sentBy.value,
          seen: message.seen,
          sentAt: message.sentAt,
        );
        return messageDto;
      }).toList());
      return messageListDto;
    });

    return streamToPublish;
  }
}
