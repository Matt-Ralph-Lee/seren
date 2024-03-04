import 'picture_memory.dart';

// class DailyPicture {
//   final PictureMemory _pictureMemory;

//   PictureMemory get pictureMemory => _pictureMemory;

//   DailyPicture(this._pictureMemory);
// }

class DailyPicture extends PictureMemory {
  DailyPicture({
    required super.shotTime,
    required super.memoryId,
    required super.primaryPath,
    required super.secondaryPath,
    required super.location,
    required super.locationAccess,
    required super.retakeTime,
  });

  factory DailyPicture.fromPictureMemory(final PictureMemory pictureMemory) {
    return DailyPicture(
        shotTime: pictureMemory.shotTime,
        memoryId: pictureMemory.memoryId,
        primaryPath: pictureMemory.primaryPath,
        secondaryPath: pictureMemory.secondaryPath,
        location: pictureMemory.location,
        locationAccess: pictureMemory.locationAccess,
        retakeTime: pictureMemory.retakeTime);
  }
}
