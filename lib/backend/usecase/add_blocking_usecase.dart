import '../model/property/user_id.dart';
import '../repository/blockings_repository.dart';

class AddBlockingUsecase {
  AddBlockingUsecase._internal();

  static final AddBlockingUsecase _cache = AddBlockingUsecase._internal();

  factory AddBlockingUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String targetUid,
  }) async {
    final userId = UserId(uid);
    final targetUserId = UserId(targetUid);

    final blockingsRepository = BlockingsRepository();

    await blockingsRepository.addBlockings(
        userId: userId, targetUserId: targetUserId);
  }
}
