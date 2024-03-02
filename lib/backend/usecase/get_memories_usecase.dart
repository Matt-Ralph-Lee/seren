import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/memory_repository.dart';
import 'package:seren/dto/memories_dto.dart';
import 'package:seren/dto/memory_dto.dart';

class GetMemoriesUsecase {
  GetMemoriesUsecase._internal();

  static final GetMemoriesUsecase _cache = GetMemoriesUsecase._internal();

  factory GetMemoriesUsecase() => _cache;

  Future<MemoriesDto> execute(final String uid) async {
    final userId = UserId(uid);

    final memoryRepository = MemoryRepository();

    final memories = await memoryRepository.getMemories(userId);

    final Map<DateTime, MemoryDto> memoriesDto = {};
    memories.memoryMap.forEach((key, value) {
      memoriesDto[key.value] = MemoryDto(
        memoryId: value.memoryId.value,
        primaryPicturePath: value.primaryPath.value,
      );
    });

    return MemoriesDto(memoriesDto);
  }
}
