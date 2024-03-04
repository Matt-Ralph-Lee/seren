import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_chat_id_usecase.dart';
import 'package:seren/dto/chat_id_dto.dart';

part 'get_chat_id_controller.g.dart';

@riverpod
class GetChatIdController extends _$GetChatIdController {
  @override
  Future<ChatIdDto> build() async {
    return ChatIdDto(value: "", exists: false);
  }

  Future<ChatIdDto> execute(final String partnerId) async {
    final uid = ref.read(userIdProvider);
    final getChatIdUsecase = GetChatIdUsecase();

    final chatId =
        await getChatIdUsecase.execute(uid: uid, partnerId: partnerId);

    return chatId;
  }
}
