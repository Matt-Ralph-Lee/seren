import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/edit_user_icon_path_usecase.dart';

part 'edit_user_icon_path_controller.g.dart';

@riverpod
class EditUserIconPathController extends _$EditUserIconPathController {
  @override
  Future<void> build() async {}

  Future<void> execute(final String newUserIconPathData) async {
    final uid = ref.read(userIdProvider);
    final editUserIconPathUsecase = EditUserIconPathUsecase();

    await editUserIconPathUsecase.execute(
        uid: uid, newUserIconPathData: newUserIconPathData);
  }
}
