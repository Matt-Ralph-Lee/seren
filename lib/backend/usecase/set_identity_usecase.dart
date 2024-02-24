import '../model/identity.dart';
import '../model/property/user_icon_path.dart';
import '../model/property/user_id.dart';
import '../model/property/username.dart';
import '../repository/identity_repository.dart';

class SetIdentityUsecase {
  SetIdentityUsecase._internal();

  static final SetIdentityUsecase _cache = SetIdentityUsecase._internal();

  factory SetIdentityUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String usernameData,
    required final String userIconPathData,
  }) async {
    final identityRepository = IdentityRepository();

    final userId = UserId(uid);
    final username = Username(usernameData);
    final userIconPath = UserIconPath(userIconPathData);

    final identity = Identity(
      userId: userId,
      username: username,
      userIconPath: userIconPath,
    );

    await identityRepository.set(userId, identity);
  }
}
