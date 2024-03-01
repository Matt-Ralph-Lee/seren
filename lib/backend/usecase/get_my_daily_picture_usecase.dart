import '../../dto/my_daily_picture_dto.dart';
import '../model/property/user_id.dart';
import '../repository/daily_picture_repository.dart';

class GetMyDailyPictureUsecase {
  GetMyDailyPictureUsecase._internal();

  static final GetMyDailyPictureUsecase _cache =
      GetMyDailyPictureUsecase._internal();

  factory GetMyDailyPictureUsecase() => _cache;

  Future<MyDailyPictureDto> execute(final String uid) async {
    final userId = UserId(uid);

    final dailyPictureRepository = DailyPictureRepositiory();

    final dailyPicture = await dailyPictureRepository.get(userId);

    final myDailyPictureDto = MyDailyPictureDto(
        memoryId: dailyPicture.pictureMemory.memoryId.value,
        picturePath: dailyPicture.pictureMemory.primaryPath.value);

    return myDailyPictureDto;
  }
}
