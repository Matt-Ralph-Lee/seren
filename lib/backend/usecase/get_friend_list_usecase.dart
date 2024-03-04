import 'package:seren/backend/repository/friends_repository.dart';
import 'package:seren/backend/repository/identity_repository.dart';
import 'package:seren/dto/friend_dto.dart';
import 'package:seren/dto/friend_list_dto.dart';

import '../model/property/user_id.dart';

class GetFriendListUsecase {
  GetFriendListUsecase._internal();

  static final GetFriendListUsecase _cache = GetFriendListUsecase._internal();

  factory GetFriendListUsecase() => _cache;

  Future<FriendListDto> execute(final String uid) async {
    final userId = UserId(uid);

    final identityRepository = IdentityRepository();
    final friendsRepository = FriendsRepository();

    final friends = await friendsRepository.getFriends(userId);

    final friendListDtoData = friends.map((friendId) async {
      final friendIdentity = await identityRepository.get(friendId);
      final friendDto = FriendDto(
        uid: friendIdentity.userId.value,
        iconPath: friendIdentity.userIconPath.value,
        name: friendIdentity.username.value,
      );
      return friendDto;
    });

    final friendListDto = await Future.wait(friendListDtoData);

    return FriendListDto(friendListDto);
  }
}
