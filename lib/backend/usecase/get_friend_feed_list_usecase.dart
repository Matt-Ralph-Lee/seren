import '../../dto/friend_feed_dto.dart';
import '../../dto/picture_memory_dto.dart';
import '../../dto/reaction_dto.dart';
import '../model/property/user_id.dart';
import '../repository/blockings_repository.dart';
import '../repository/daily_picture_repository.dart';
import '../repository/friends_repository.dart';
import '../repository/identity_repository.dart';
import '../repository/reactions_repository.dart';

class GetFriendFeedListUsecase {
  GetFriendFeedListUsecase._internal();

  static final GetFriendFeedListUsecase _cache =
      GetFriendFeedListUsecase._internal();

  factory GetFriendFeedListUsecase() => _cache;

  Future<List<FriendFeedDto>> execute(final String uid) async {
    final userId = UserId(uid);

    final friendsRepository = FriendsRepository();
    final identityRepository = IdentityRepository();
    final dailyPictureRepository = DailyPictureRepositiory();
    final reactionRepository = ReactionRepository();
    final blockingsRepository = BlockingsRepository();

    final userFriends = await friendsRepository.getFriends(userId);
    final userBlockings = await blockingsRepository.getBlockings(userId);

    final friendFeedDtoListData = userFriends
        .where((friendUserId) => !userBlockings.contains(friendUserId))
        .map((friendUserId) async {
      final friendIdentity = await identityRepository.get(friendUserId);
      final friendDailyPicture = await dailyPictureRepository.get(friendUserId);

      final pictureMemoryDto =
          PictureMemoryDto.fromPictureMemory(friendDailyPicture);

      final commonFriendsReactions =
          await reactionRepository.getCommonFriendsReaction(
        friendUserId: friendUserId,
        friends: userFriends,
        memoryId: friendDailyPicture.memoryId,
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
        memoryId: friendDailyPicture.memoryId.value,
        pictureMemory: pictureMemoryDto,
        reactionList: reactionList,
      );
    });

    final friendFeedDtoList = await Future.wait(friendFeedDtoListData);

    return friendFeedDtoList;
  }
}
