import 'package:seren/backend/repository/dislikes_repository.dart';
import 'package:seren/backend/repository/liked_by_repository.dart';

import '../model/property/user_id.dart';

class DislikeStrangerUsecase {
  DislikeStrangerUsecase._internal();

  static final DislikeStrangerUsecase _cache =
      DislikeStrangerUsecase._internal();

  factory DislikeStrangerUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String strangerUid,
    required final bool likedBy,
  }) async {
    final disLikesRepository = DisLikesRepository();
    final likedByRepository = LikedByRepository();

    final userId = UserId(uid);
    final strangerUserId = UserId(strangerUid);

    if (likedBy) {
      await likedByRepository.delete(
          userId: userId, strangerUserId: strangerUserId);
    }

    await disLikesRepository.set(
        userId: userId, strangerUserId: strangerUserId);
  }
}
