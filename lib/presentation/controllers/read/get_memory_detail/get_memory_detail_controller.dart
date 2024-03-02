import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/get_memory_detail_usecase.dart';
import 'package:seren/dto/memory_detail_dto.dart';

part 'get_memory_detail_controller.g.dart';

@riverpod
class GetMemoryDetailController extends _$GetMemoryDetailController {
  @override
  Future<MemoryDetailDto> build(final String targetMemoryId) async {
    final uid = ref.read(userIdProvider);
    final getMemoryDetailUsecase = GetMemoryDetailUsecase();
    final memoryDetail = await getMemoryDetailUsecase.execute(
        uid: uid, memoryIdData: targetMemoryId);

    return memoryDetail;
  }
}
