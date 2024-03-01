import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_friend_feed_list_usercase.dart';
import 'package:seren/dto/friend_feed_dto.dart';

part 'get_friend_feed_list_controller.g.dart';

@riverpod
class GetFriendFeedListController extends _$GetFriendFeedListController {
  @override
  Future<List<FriendFeedDto>> build() async {
    final uid = ref.read(userIdProvider);
    final getFriendFeedListUsecase = GetFriendFeedListUsercase();
    final friendFeedList = await getFriendFeedListUsecase.execute(uid);
    print(friendFeedList.length);

    return friendFeedList;
  }
}
