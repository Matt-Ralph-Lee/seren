import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/liked_by_repository.dart';
import 'package:seren/backend/repository/likes_repository.dart';

class LikeStrangerUsecase {
  LikeStrangerUsecase._internal();

  static final LikeStrangerUsecase _cache = LikeStrangerUsecase._internal();

  factory LikeStrangerUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String strangerUid,
    required final bool likedBy,
  }) async {
    final likesRepository = LikesRepository();
    final likedByRepository = LikedByRepository();

    final userId = UserId(uid);
    final strangerUserId = UserId(strangerUid);

    if (likedBy) {
      // TODO: implement below
      // notification function
      print("hello");
      await likedByRepository.updateLikedBySeen(
          userId: userId, strangerUserId: strangerUserId);
    } else {
      print("hog??");
    }

    await likesRepository.set(userId: userId, strangerUserId: strangerUserId);
    await likedByRepository.set(userId: userId, strangerUserId: strangerUserId);
  }
}
