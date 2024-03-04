import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/edit_username_usecase.dart';

part 'edit_username_controller.g.dart';

@riverpod
class EditUsernameController extends _$EditUsernameController {
  @override
  Future<void> build() async {}

  Future<void> execute(final String newUsernameData) async {
    final uid = ref.read(userIdProvider);
    final editUsernameUsecase = EditUsernameUsecase();

    await editUsernameUsecase.execute(
        uid: uid, newUsernameData: newUsernameData);
  }
}
