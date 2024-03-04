import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_message_list_usecase.dart';
import 'package:seren/dto/message_list_dto.dart';

part 'get_message_list_controller.g.dart';

@riverpod
class GetMessageListController extends _$GetMessageListController {
  @override
  Stream<MessageListDto> build(final String chatIdData) {
    final uid = ref.read(userIdProvider);
    final getMessageListUsecase = GetMessageListUsecase();

    final messageListStream =
        getMessageListUsecase.execute(uid: uid, chatIdData: chatIdData);

    return messageListStream;
  }
}
