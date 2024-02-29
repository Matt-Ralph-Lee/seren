import 'package:seren/backend/function/server.dart';
import 'package:seren/backend/repository/daily_picture_repository.dart';
import 'package:seren/backend/repository/identity_repository.dart';
import 'package:seren/backend/repository/profile_repository.dart';
import 'package:seren/backend/repository/selected_picture_repository.dart';
import 'package:seren/dto/location_dto.dart';
import 'package:seren/dto/picture_memory_dto.dart';

import '../../dto/stranger_dto.dart';
import '../model/property/user_id.dart';

class GetStrangersUsecase {
  GetStrangersUsecase._internal();

  static final GetStrangersUsecase _cache = GetStrangersUsecase._internal();

  factory GetStrangersUsecase() => _cache;

  Future<List<StrangerDto>> execute(
      {required final String uid, required final int numberOfStranger}) async {
    final userId = UserId(uid);
    final strangers = await Server()
        .getStrangerUid(userId: userId, numberOfStranger: numberOfStranger);

    final identityRepository = IdentityRepository();
    final profilerepository = ProfileRepository();
    final dailyPictureRepository = DailyPictureRepositiory();
    final selectedPictureRepository = SelectedPictureRepository();

    List<StrangerDto> strangerDtoList = [];

    for (final stranger in strangers) {
      final strangerUserId = stranger["strangerUid"];
      final likedBy = stranger["likedBy"] as bool;

      final strangerUsername =
          await identityRepository.getUsername(strangerUserId);
      final strangerShortIntro =
          await profilerepository.getShortIntro(strangerUserId);
      final strangerDailyPicture =
          await dailyPictureRepository.get(strangerUserId);
      final strangerSelectedPicture =
          await selectedPictureRepository.get(strangerUserId);

      final strangerDto = StrangerDto(
        uid: strangerUserId.value,
        username: strangerUsername.value,
        shortIntro: strangerShortIntro.value,
        dailyPicture: PictureMemoryDto(
          primaryPath: strangerDailyPicture.pictureMemory.primaryPath.value,
          secondaryPath: strangerDailyPicture.pictureMemory.secondaryPath.value,
          location: LocationDto(
            latitude: strangerDailyPicture.pictureMemory.location.latitude,
            longitude: strangerDailyPicture.pictureMemory.location.longitude,
          ),
          retakeTime: strangerDailyPicture.pictureMemory.retakeTime.value,
          shotTime: strangerDailyPicture.pictureMemory.shotTime.value,
        ),
        selectedPicture: strangerSelectedPicture
            .map((picture) => PictureMemoryDto(
                  primaryPath: picture.primaryPath.value,
                  secondaryPath: picture.secondaryPath.value,
                  location: LocationDto(
                    latitude: picture.location.latitude,
                    longitude: picture.location.longitude,
                  ),
                  retakeTime: picture.retakeTime.value,
                  shotTime: picture.shotTime.value,
                ))
            .toList(),
        likedBy: likedBy,
      );
      strangerDtoList.add(strangerDto);
    }
    return strangerDtoList;
  }
}
