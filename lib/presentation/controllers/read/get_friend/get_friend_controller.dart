import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_friend_usecase.dart';
import 'package:seren/dto/friend_dto.dart';

part 'get_friend_controller.g.dart';

@riverpod
class GetFriendController extends _$GetFriendController {
  @override
  Future<FriendDto> build() async {
    final uid = ref.read(userIdProvider);
    final getFriendUsecase = GetFriendUsecase();

    final friend = await getFriendUsecase.execute(uid);

    return friend;
  }
}
