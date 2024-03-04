import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/add_message_usecase.dart';

part 'add_message_controller.g.dart';

@riverpod
class AddMessageController extends _$AddMessageController {
  @override
  Future<void> build() async {}

  Future<void> execute({
    required final String messageTextData,
    required final String chatIdData,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final uid = ref.read(userIdProvider);
      final addMessageUsecase = AddMessageUsecase();

      await addMessageUsecase.execute(
        uid: uid,
        messageTextData: messageTextData,
        chatIdData: chatIdData,
      );
    });
  }
}
