import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/blockings_repository.dart';
import 'package:seren/backend/repository/daily_picture_repository.dart';
import 'package:seren/backend/repository/friends_repository.dart';
import 'package:seren/backend/repository/identity_repository.dart';
import 'package:seren/backend/repository/reactions_repository.dart';
import 'package:seren/dto/friend_feed_dto.dart';
import 'package:seren/dto/location_access_dto.dart';
import 'package:seren/dto/location_dto.dart';
import 'package:seren/dto/picture_memory_dto.dart';

import '../../dto/reaction_dto.dart';

class GetFriendFeedListUsercase {
  GetFriendFeedListUsercase._internal();

  static final GetFriendFeedListUsercase _cache =
      GetFriendFeedListUsercase._internal();

  factory GetFriendFeedListUsercase() => _cache;

  Future<List<FriendFeedDto>> execute(final String uid) async {
    final userId = UserId(uid);

    final friendsRepository = FriendsRepository();
    final identityRepository = IdentityRepository();
    final dailyPictureRepository = DailyPictureRepositiory();
    final reactionRepository = ReactionRepository();
    final blockingsRepository = BlockingsRepository();

    final userFriends = await friendsRepository.getFriends(userId);
    final userBlockings = await blockingsRepository.getBlockings(userId);

    final friendFeedDtoList = userFriends
        .where((friendUserId) => !userBlockings.contains(friendUserId))
        .map((friendUserId) async {
      final friendIdentity = await identityRepository.get(friendUserId);
      final friendDailyPicture = await dailyPictureRepository.get(friendUserId);

      final pictureMemoryDto = PictureMemoryDto(
        primaryPath: friendDailyPicture.pictureMemory.primaryPath.value,
        secondaryPath: friendDailyPicture.pictureMemory.secondaryPath.value,
        location: LocationDto(
          latitude: friendDailyPicture.pictureMemory.location.latitude,
          longitude: friendDailyPicture.pictureMemory.location.longitude,
        ),
        locationAccess: LocationAccessDto(
            friendDailyPicture.pictureMemory.locationAccess.value),
        retakeTime: friendDailyPicture.pictureMemory.retakeTime.value,
        shotTime: friendDailyPicture.pictureMemory.shotTime.value,
      );

      final commonFriendsReactions =
          await reactionRepository.getCommonFriendsReaction(
        friendUserId: friendUserId,
        friends: userFriends,
        memoryId: friendDailyPicture.pictureMemory.memoryId,
      );

      final reactionList = commonFriendsReactions
          .map((reaction) => ReactionDto(
              reactedUid: reaction.reactedBy.value,
              reactionPicturePath: reaction.reactionPath.value))
          .toList();

      return FriendFeedDto(
        uid: friendIdentity.userId.value,
        userProfileIconPath: friendIdentity.userIconPath.value,
        username: friendIdentity.username.value,
        memoryId: friendDailyPicture.pictureMemory.memoryId.value,
        pictureMemory: pictureMemoryDto,
        reactionList: reactionList,
      );
    });

    return Future.wait(friendFeedDtoList);
  }
}
