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
  final db = Database.realtimeDatabase;

  Future<void> setDefault(final UserId userId) async {
    final memoryId = MemoryId("defaultMemoryId");
    final primaryPath =
        PrimaryPath(await StorageRepository().getDefaultPrimaryPathURL());
    final secondaryPath =
        SecondaryPath(await StorageRepository().getDefaultSecondaryPathURL());
    final retakeTime = RetakeTime(0);
    final location = Location(latitude: 0.1, longitude: 0.1);
    final locationAccess = LocationAccess("private");
    final shotTime = ShotTime(DateTime.now());

    final dailyPicture = DailyPicture(
      shotTime: shotTime,
      memoryId: memoryId,
      primaryPath: primaryPath,
      secondaryPath: secondaryPath,
      location: location,
      locationAccess: locationAccess,
      retakeTime: retakeTime,
    );

    await db.child("user/${userId.value}/dailyPicture").set({
      "memoryId": dailyPicture.memoryId.value,
      "primaryPicturePath": dailyPicture.primaryPath.value,
      "secondaryPicturePath": dailyPicture.secondaryPath.value,
      "location": {
        "latitude": dailyPicture.location.latitude,
        "longitude": dailyPicture.location.longitude,
      },
      "locationAccess": dailyPicture.locationAccess.value,
      "shotTime": dailyPicture.shotTime.value.millisecondsSinceEpoch,
      "retakeTime": 0,
    });
  }

  Future<DailyPicture> get(final UserId userId) async {
    final event = await db.child("user/${userId.value}/dailyPicture").once();
    final dailyPictureData = event.snapshot.value as Map<dynamic, dynamic>?;
    if (dailyPictureData == null) throw Exception("cannot find dailyPicture");

    return DailyPicture.fromPictureMemory(
        PictureMemory.fromRTDB(dailyPictureData));
  }
}
