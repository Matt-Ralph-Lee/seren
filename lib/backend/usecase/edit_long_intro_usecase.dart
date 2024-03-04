import '../model/property/long_intro.dart';
import '../model/property/user_id.dart';
import '../repository/profile_repository.dart';

class EditLongIntroUsecase {
  EditLongIntroUsecase._internal();

  static final EditLongIntroUsecase _cache = EditLongIntroUsecase._internal();

  factory EditLongIntroUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String newLongIntroData,
  }) async {
    final userId = UserId(uid);
    final newLongIntro = LongIntro(newLongIntroData);

    final profileRepository = ProfileRepository();

    await profileRepository.editLongIntro(
        userId: userId, newLongIntro: newLongIntro);
  }
}
