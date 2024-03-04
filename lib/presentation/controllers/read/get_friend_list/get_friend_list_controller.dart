import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_friend_list_usecase.dart';
import 'package:seren/dto/friend_list_dto.dart';

part 'get_friend_list_controller.g.dart';

@riverpod
class GetFriendListController extends _$GetFriendListController {
  @override
  Future<FriendListDto> build() async {
    final uid = ref.read(userIdProvider);
    final getFriendListUsecase = GetFriendListUsecase();

    final friendList = await getFriendListUsecase.execute(uid);

    return friendList;
  }
}
