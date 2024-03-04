import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/edit_long_intro_usecase.dart';

part 'edit_long_intro_controller.g.dart';

@riverpod
class EditLongIntroController extends _$EditLongIntroController {
  @override
  Future<void> build() async {}

  Future<void> execute(final String newLongIntroData) async {
    final uid = ref.read(userIdProvider);

    final editLongIntroUsecase = EditLongIntroUsecase();

    await editLongIntroUsecase.execute(
        uid: uid, newLongIntroData: newLongIntroData);
  }
}
