import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/add_chat_usecase.dart';
import 'package:seren/dto/chat_id_dto.dart';

part 'add_chat_controller.g.dart';

@riverpod
class AddChatController extends _$AddChatController {
  @override
  Future<void> build() async {}

  Future<ChatIdDto> execute(final String partnerId) async {
    state = const AsyncLoading();
    ChatIdDto chatId = ChatIdDto(value: "", exists: false);
    state = await AsyncValue.guard(() async {
      final uid = ref.read(userIdProvider);
      final addChatUsecase = AddChatUsecase();

      chatId = await addChatUsecase.execute(uid: uid, partnerId: partnerId);
    });

    return chatId;
  }
}
