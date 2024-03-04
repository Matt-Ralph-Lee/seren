import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/identity_repository.dart';
import 'package:seren/dto/friend_dto.dart';

class GetFriendUsecase {
  GetFriendUsecase._internal();

  static final GetFriendUsecase _cache = GetFriendUsecase._internal();

  factory GetFriendUsecase() => _cache;

  Future<FriendDto> execute(final String uid) async {
    final userId = UserId(uid);

    final identityRepository = IdentityRepository();

    final friend = await identityRepository.get(userId);

    return FriendDto(
      uid: friend.userId.value,
      iconPath: friend.userIconPath.value,
      name: friend.username.value,
    );
  }
}
