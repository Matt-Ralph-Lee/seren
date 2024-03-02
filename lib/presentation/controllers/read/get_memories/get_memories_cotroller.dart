import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_memories_usecase.dart';
import 'package:seren/dto/memories_dto.dart';

part 'get_memories_cotroller.g.dart';

@riverpod
class GetMemoriesCotroller extends _$GetMemoriesCotroller {
  @override
  Future<MemoriesDto> build() async {
    final uid = ref.read(userIdProvider);
    final getMemoriesUsecase = GetMemoriesUsecase();
    final memories = await getMemoriesUsecase.execute(uid);

    return memories;
  }
}
