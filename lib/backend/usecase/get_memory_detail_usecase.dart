import 'package:seren/backend/model/property/memory_id.dart';
import 'package:seren/backend/repository/memory_repository.dart';
import 'package:seren/dto/memory_detail_dto.dart';

import '../model/property/user_id.dart';

class GetMemoryDetailUsecase {
  GetMemoryDetailUsecase._internal();

  static final GetMemoryDetailUsecase _cache =
      GetMemoryDetailUsecase._internal();

  factory GetMemoryDetailUsecase() => _cache;

  Future<MemoryDetailDto> execute({
    required final String uid,
    required final String memoryIdData,
  }) async {
    final userId = UserId(uid);
    final memoryId = MemoryId(memoryIdData);

    final memoryRepository = MemoryRepository();

    final memory = await memoryRepository.getMemoryDetail(
        userId: userId, memoryId: memoryId);

    return memory;
  }
}
