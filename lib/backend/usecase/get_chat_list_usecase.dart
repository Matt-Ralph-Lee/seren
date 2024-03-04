import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/chat_list_repository.dart';
import 'package:seren/dto/chat_dto.dart';
import 'package:seren/dto/chat_list_dto.dart';
import 'package:seren/dto/message_dto.dart';

class GetChatListUsecase {
  GetChatListUsecase._internal();

  static final GetChatListUsecase _cache = GetChatListUsecase._internal();

  factory GetChatListUsecase() => _cache;

  Stream<ChatListDto> execute(final String uid) {
    final userId = UserId(uid);

    final chatListRepository = ChatListRepository();

    final chatListStream = chatListRepository.getChatListStream(userId);

    final streamToPublish = chatListStream.map((chatList) {
      final chatListDto = ChatListDto(chatList.map((chat) {
        final chatDto = ChatDto(
          chatId: chat.chatId.value,
          partnerIconPath: chat.partnerIconPath.value,
          partnerName: chat.partnerName.value,
          message: MessageDto(
            messageText: chat.lastMessage.messageText.value,
            sentBy: chat.lastMessage.sentBy.value,
            seen: chat.lastMessage.seen,
            sentAt: chat.lastMessage.sentAt,
          ),
        );
        return chatDto;
      }).toList());
      return chatListDto;
    });

    return streamToPublish;
  }
}
