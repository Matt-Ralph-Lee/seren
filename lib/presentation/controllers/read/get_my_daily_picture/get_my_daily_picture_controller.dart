import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:seren/backend/state/auth/auth_state.dart";
import "package:seren/backend/usecase/get_my_daily_picture_usecase.dart";
import "package:seren/dto/my_daily_picture_dto.dart";

part 'get_my_daily_picture_controller.g.dart';

@riverpod
class GetMyDailyPictureController extends _$GetMyDailyPictureController {
  @override
  Future<MyDailyPictureDto> build() async {
    final uid = ref.read(userIdProvider);
    final getMyDailyPicture = GetMyDailyPictureUsecase();
    final myDailyPictureDto = await getMyDailyPicture.execute(uid);

    return myDailyPictureDto;
  }
}
