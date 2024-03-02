import 'memory_dto.dart';

class MemoriesDto {
  final Map<DateTime, MemoryDto> _memories;

  Map<DateTime, MemoryDto> get memories => _memories;

  MemoriesDto(this._memories);
}
