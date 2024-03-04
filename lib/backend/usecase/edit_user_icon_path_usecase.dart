import '../model/property/user_icon_path.dart';
import '../model/property/user_id.dart';
import '../repository/identity_repository.dart';

class EditUserIconPathUsecase {
  EditUserIconPathUsecase._internal();

  static final EditUserIconPathUsecase _cache =
      EditUserIconPathUsecase._internal();

  factory EditUserIconPathUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String newUserIconPathData,
  }) async {
    final userId = UserId(uid);
    final newUserIconPath = UserIconPath(newUserIconPathData);

    final identityReporitory = IdentityRepository();

    await identityReporitory.editUserIconPath(
        userId: userId, newUserIconPath: newUserIconPath);
  }
}
