import '../model/daily_picture.dart';
import '../model/picture_memory.dart';
import '../model/property/location.dart';
import '../model/property/location_access.dart';
import '../model/property/memory_id.dart';
import '../model/property/primary_path.dart';
import '../model/property/retake_time.dart';
import '../model/property/secondary_path.dart';
import '../model/property/shot_time.dart';
import '../model/property/user_id.dart';
import 'database.dart';
import 'storage_repository.dart';

class DailyPictureRepositiory {
  final db = Database.realtimeDatabaes;

  Future<void> setDefault(final UserId userId) async {
    final memoryId = MemoryId("defaultMemoryId");
    final primaryPath =
        PrimaryPath(await StorageRepository().getDefaultPrimaryPathURL());
    final secondaryPath =
        SecondaryPath(await StorageRepository().getDefaultSecondaryPathURL());
    final retakeTime = RetakeTime(0);
    final location = Location(latitude: 0, longitude: 0);
    final locationAccess = LocationAccess("private");
    final shotTime = ShotTime(DateTime.now());

    final dailyPicture = DailyPicture(
      PictureMemory(
        shotTime: shotTime,
        memoryId: memoryId,
        primaryPath: primaryPath,
        secondaryPath: secondaryPath,
        location: location,
        locationAccess: locationAccess,
        retakeTime: retakeTime,
      ),
    );

    await db.child("user/${userId.value}/dailyPicture").set({
      "memoryId": dailyPicture.pictureMemory.memoryId.value,
      "primaryPicturePath": dailyPicture.pictureMemory.primaryPath.value,
      "secondaryPicturePath": dailyPicture.pictureMemory.secondaryPath.value,
      "location": {
        "latitude": dailyPicture.pictureMemory.location.latitude,
        "longitude": dailyPicture.pictureMemory.location.longitude,
      },
      "locationAccess": dailyPicture.pictureMemory.locationAccess.value,
      "shotTime":
          dailyPicture.pictureMemory.shotTime.value.millisecondsSinceEpoch,
    });
  }
}
