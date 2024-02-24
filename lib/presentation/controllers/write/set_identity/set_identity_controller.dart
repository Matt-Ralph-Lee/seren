import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:seren/backend/state/auth/auth_state.dart";
import "package:seren/backend/usecase/set_identity_usecase.dart";
import "package:seren/backend/usecase/set_user_icon_usecase.dart";

part "set_identity_controller.g.dart";

@riverpod
class SetIdentityController extends _$SetIdentityController {
  @override
  Future<void> build() async {}

  Future<void> execute({
    required final String usernameData,
    required final String userIconPathData,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final setIdentityUsecase = SetIdentityUsecase();
      final setUserIconUsecase = SetUserIconUsecase();

      final uid = ref.read(userIdProvider);
      final userIconPath =
          await setUserIconUsecase.execute(uid, userIconPathData);
      setIdentityUsecase.execute(
        uid: uid,
        usernameData: usernameData,
        userIconPathData: userIconPath,
      );
    });
  }
}
