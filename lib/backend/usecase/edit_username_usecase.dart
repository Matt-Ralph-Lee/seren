import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/model/property/username.dart';

import '../repository/identity_repository.dart';

class EditUsernameUsecase {
  EditUsernameUsecase._internal();

  static final EditUsernameUsecase _cache = EditUsernameUsecase._internal();

  factory EditUsernameUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String newUsernameData,
  }) async {
    final userId = UserId(uid);
    final newUsername = Username(newUsernameData);

    final identityRepository = IdentityRepository();

    await identityRepository.editUsername(
        userId: userId, newUsername: newUsername);
  }
}
