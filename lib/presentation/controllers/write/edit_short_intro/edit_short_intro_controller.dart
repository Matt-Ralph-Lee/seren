import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/usecase/edit_short_intro_usecase.dart';

import '../../../../backend/state/auth/auth_state.dart';

part 'edit_short_intro_controller.g.dart';

@riverpod
class EditShortIntroController extends _$EditShortIntroController {
  @override
  Future<void> build() async {}

  Future<void> execute(final String newShortIntroData) async {
    final uid = ref.read(userIdProvider);
    final editShortIntroUsecase = EditShortIntroUsecase();

    await editShortIntroUsecase.execute(
        uid: uid, newShortIntroData: newShortIntroData);
  }
}
