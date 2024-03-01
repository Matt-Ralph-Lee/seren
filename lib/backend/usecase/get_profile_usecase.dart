import 'package:seren/backend/repository/daily_picture_repository.dart';
import 'package:seren/backend/repository/friends_repository.dart';
import 'package:seren/backend/repository/profile_repository.dart';
import 'package:seren/backend/repository/selected_picture_repository.dart';
import 'package:seren/dto/gender_dto.dart';
import 'package:seren/dto/picture_memory_dto.dart';
import 'package:seren/dto/profile_dto.dart';

import '../model/property/user_id.dart';
import '../repository/identity_repository.dart';

class GetProfileUsecase {
  GetProfileUsecase._internal();

  static final GetProfileUsecase _cache = GetProfileUsecase._internal();

  factory GetProfileUsecase() => _cache;

  Future<ProfileDto> execute({
    required final String uid,
    required final String otherUid,
  }) async {
    final userId = UserId(uid);
    final otherUserId = UserId(otherUid);

    final identityRepository = IdentityRepository();
    final profileRepository = ProfileRepository();
    final dailyPictureRepository = DailyPictureRepositiory();
    final selectedPictureRepository = SelectedPictureRepository();
    final friendsRepository = FriendsRepository();

    final identity = await identityRepository.get(userId);
    final profile = await profileRepository.get(userId);
    final dailyPicture = await dailyPictureRepository.get(userId);
    final selectedPicture = await selectedPictureRepository.get(userId);

    final dailyPictureDto =
        PictureMemoryDto.fromPictureMemory(dailyPicture.pictureMemory);

    final selectedPictureDto = selectedPicture.map((picture) {
      return PictureMemoryDto.fromPictureMemory(picture);
    }).toList();

    final isFriend = await friendsRepository.checkIsFriend(
        userId: userId, otherUserId: otherUserId);

    final profileDto = ProfileDto(
      dailyPicture: dailyPictureDto,
      selectedPicture: selectedPictureDto,
      username: identity.username.value,
      userIconPath: identity.userIconPath.value,
      gender: GenderDto(profile.gender.value),
      shortIntro: profile.shortIntro.value,
      longIntro: profile.longIntro.value,
      isFriend: isFriend,
    );

    return profileDto;
  }
}
