import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_profile_usecase.dart';
import 'package:seren/dto/profile_dto.dart';

part 'get_profile_controller.g.dart';

@riverpod
class GetProfileController extends _$GetProfileController {
  @override
  Future<ProfileDto> build(final String targetUid) async {
    final uid = ref.read(userIdProvider);
    final getProfileUsecase = GetProfileUsecase();
    final profile =
        await getProfileUsecase.execute(uid: uid, otherUid: targetUid);
    return profile;
  }
}
