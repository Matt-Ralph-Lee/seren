import '../repository/local_repository/user_local_repository.dart';
import '../model/property/user_id.dart';
import '../repository/daily_picture_repository.dart';
import '../repository/identity_repository.dart';
import '../repository/memory_repository.dart';
import '../repository/profile_repository.dart';

class SetNewUserUsecase {
  SetNewUserUsecase._internal();

  static final SetNewUserUsecase _cache = SetNewUserUsecase._internal();

  factory SetNewUserUsecase() => _cache;

  Future<void> execute(String uid) async {
    final userId = UserId(uid);

    IdentityRepository().setDefault(userId);
    ProfileRepository().setDefault(userId);
    DailyPictureRepositiory().setDefault(userId);
    // SelectedPictureRepository().setDefault(userId);
    // ReactionRepository().setDefault(userId);
    // FriendsRepository().setDefault(userId);
    // LikesRepository().setDefault(userId);
    // DisLikesRepository().setDefault(userId);
    // LikedByRepository().setDefault(userId);
    // BlockingsRepository().setDefault(userId);
    // ChatListRepository().setDefault(userId);

    // firestore
    MemoryRepository().setDefault(userId);

    UserLocalRepository().setDefault();
  }
}
