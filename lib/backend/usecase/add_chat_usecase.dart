import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/chat_list_repository.dart';
import 'package:seren/dto/chat_id_dto.dart';

class AddChatUsecase {
  AddChatUsecase._internal();

  static final AddChatUsecase _cache = AddChatUsecase._internal();

  factory AddChatUsecase() => _cache;

  Future<ChatIdDto> execute({
    required final String uid,
    required final String partnerId,
  }) async {
    final userId = UserId(uid);
    final partnerUserId = UserId(partnerId);

    final chatListRepository = ChatListRepository();

    final chatIdData = await chatListRepository.addChat(
        userId: userId, partnerUserId: partnerUserId);

    return ChatIdDto(value: chatIdData, exists: true);
  }
}
