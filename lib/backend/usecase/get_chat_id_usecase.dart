import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/chat_list_repository.dart';
import 'package:seren/dto/chat_id_dto.dart';

class GetChatIdUsecase {
  GetChatIdUsecase._internal();

  static final GetChatIdUsecase _cache = GetChatIdUsecase._internal();

  factory GetChatIdUsecase() => _cache;

  Future<ChatIdDto> execute({
    required final String uid,
    required final String partnerId,
  }) async {
    final userId = UserId(uid);
    final partnerUserId = UserId(partnerId);

    final chatListRepository = ChatListRepository();

    final chatId = await chatListRepository.getChatId(
        userId: userId, partnerUserId: partnerUserId);

    if (chatId != null) {
      return ChatIdDto(value: chatId.value, exists: true);
    }

    return ChatIdDto(value: "", exists: false);
  }
}
