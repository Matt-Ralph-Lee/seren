class MemoryDto {
  final String _memoryId;
  final String _primaryPicturePath;

  String get memoryId => _memoryId;
  String get primaryPicturePath => _primaryPicturePath;

  MemoryDto({
    required final String memoryId,
    required final String primaryPicturePath,
  })  : _memoryId = memoryId,
        _primaryPicturePath = primaryPicturePath;
}
