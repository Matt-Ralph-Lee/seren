import '../repository/reactions_repository.dart';

import '../model/reaction.dart';
import '../model/property/memory_id.dart';
import '../model/property/reaction_path.dart';
import '../model/property/user_id.dart';

class ReactToFeedUsecase {
  ReactToFeedUsecase._internal();

  static final ReactToFeedUsecase _cache = ReactToFeedUsecase._internal();

  factory ReactToFeedUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String friendUid,
    required final String memoryIdData,
    required final String reactionPicturePath,
  }) async {
    final userId = UserId(uid);
    final friendUserId = UserId(friendUid);
    final memoryId = MemoryId(memoryIdData);
    final reactionPath = ReactionPath(reactionPicturePath);
    final reaction = Reaction(
        memoryId: memoryId, reactedBy: userId, reactionPath: reactionPath);

    final reactionRepository = ReactionRepository();

    await reactionRepository.add(reaction: reaction, feedOwnerId: friendUserId);

    // TODO: notify
  }
}
