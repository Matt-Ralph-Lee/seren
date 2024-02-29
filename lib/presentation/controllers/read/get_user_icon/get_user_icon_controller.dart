import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:seren/backend/state/auth/auth_state.dart";
import "package:seren/backend/usecase/get_user_icon_usecase.dart";
import "package:seren/dto/user_icon_dto.dart";

part "get_user_icon_controller.g.dart";

@riverpod
class GetUserIconController extends _$GetUserIconController {
  @override
  Future<UserIconDto> build() async {
    final getUserIconUsecase = GetUserIconUsecase();
    final uid = ref.read(userIdProvider);
    final userIconDto = await getUserIconUsecase.execute(uid);
    return userIconDto;
  }
}
