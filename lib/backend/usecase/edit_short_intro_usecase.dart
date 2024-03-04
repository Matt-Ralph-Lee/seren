import 'package:seren/backend/model/property/short_intro.dart';
import 'package:seren/backend/repository/profile_repository.dart';

import '../model/property/user_id.dart';

class EditShortIntroUsecase {
  EditShortIntroUsecase._internal();

  static final EditShortIntroUsecase _cache = EditShortIntroUsecase._internal();

  factory EditShortIntroUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String newShortIntroData,
  }) async {
    final userId = UserId(uid);
    final newShortIntro = ShortIntro(newShortIntroData);

    final profileRepository = ProfileRepository();

    await profileRepository.editShortIntro(
        userId: userId, newShortIntro: newShortIntro);
  }
}
