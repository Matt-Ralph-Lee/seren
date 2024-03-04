import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_friend_count_usecase.dart';
import 'package:seren/dto/friend_count_dto.dart';

part 'get_friend_count_controller.g.dart';

@riverpod
class GetFriendCountController extends _$GetFriendCountController {
  @override
  Future<FriendCountDto> build() async {
    final uid = ref.read(userIdProvider);
    final getFriendCountUsecase = GetFriendCountUsecase();

    final friendCount = await getFriendCountUsecase.execute(uid);

    return friendCount;
  }
}
