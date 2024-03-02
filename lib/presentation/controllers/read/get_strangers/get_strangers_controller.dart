import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:seren/backend/state/auth/auth_state.dart";
import "package:seren/backend/usecase/get_strangers_usecase.dart";
import "package:seren/dto/stranger_dto.dart";

part "get_strangers_controller.g.dart";

@riverpod
class GetStrangersController extends _$GetStrangersController {
  @override
  Future<List<StrangerDto>> build() async {
    final uid = ref.read(userIdProvider);
    final getStrangersUsecase = GetStrangersUsecase();
    final strangerDtoList =
        await getStrangersUsecase.execute(uid: uid, numberOfStranger: 1);
    return strangerDtoList;
  }

  Future<void> updateState() async {
    state.whenData((value) async {
      final uid = ref.watch(userIdProvider);
      final getStrangersUsecase = GetStrangersUsecase();
      final strangerDtoList =
          await getStrangersUsecase.execute(uid: uid, numberOfStranger: 1);
      if (strangerDtoList.isNotEmpty) {
        value.add(strangerDtoList.first);
        state = AsyncData(value);
      }
    });
  }
}
