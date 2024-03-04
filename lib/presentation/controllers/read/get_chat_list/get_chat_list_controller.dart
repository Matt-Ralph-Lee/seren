import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_chat_list_usecase.dart';
import 'package:seren/dto/chat_list_dto.dart';

part 'get_chat_list_controller.g.dart';

@riverpod
class GetChatListController extends _$GetChatListController {
  @override
  Stream<ChatListDto> build() {
    final uid = ref.read(userIdProvider);
    final getChatListUsecase = GetChatListUsecase();

    final chatListStream = getChatListUsecase.execute(uid);

    return chatListStream;
  }
}
