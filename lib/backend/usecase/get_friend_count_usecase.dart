import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/friends_repository.dart';
import 'package:seren/dto/friend_count_dto.dart';

class GetFriendCountUsecase {
  GetFriendCountUsecase._internal();

  static final GetFriendCountUsecase _cache = GetFriendCountUsecase._internal();

  factory GetFriendCountUsecase() => _cache;

  Future<FriendCountDto> execute(final String uid) async {
    final userId = UserId(uid);

    final friendsRepository = FriendsRepository();

    final friendCount = await friendsRepository.getFriendCount(userId);

    return FriendCountDto(friendCount);
  }
}
