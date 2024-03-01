class MyDailyPictureDto {
  final String _memoryId;
  final String _picturePath;

  String get memoryId => _memoryId;
  String get picturePath => _picturePath;

  MyDailyPictureDto({
    required final String memoryId,
    required final String picturePath,
  })  : _memoryId = memoryId,
        _picturePath = picturePath;
}
