import 'package:seren/backend/model/selected_picture.dart';

import '../model/property/user_id.dart';
import 'database.dart';

class SelectedPictureRepository {
  final db = Database.realtimeDatabase;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/selectedPicture").set({});
  }

  Future<SelectedPicture> get(final UserId userId) async {
    final event = await db.child("user/${userId.value}/selectedPicture").once();
    final selectedPictureData = event.snapshot.value as Map<String, dynamic>?;
    if (selectedPictureData == null) return SelectedPicture([]);
    return SelectedPicture.fromRTDB(selectedPictureData);
  }

  Future<void> edit({
    required final UserId userId,
    required final SelectedPicture newSelectedPicture,
  }) async {
    final setData = Map<String, dynamic>.from({});
    for (var i = 0; i < newSelectedPicture.length; i++) {
      setData["$i"] = {
        "memoryId": newSelectedPicture[i].memoryId.value,
        "primaryPicturePath": newSelectedPicture[i].primaryPath.value,
        "secondaryPicturePath": newSelectedPicture[i].secondaryPath.value,
        "retakeTime": newSelectedPicture[i].retakeTime.value,
        "location": {
          "latitude": newSelectedPicture[i].location.latitude,
          "longitude": newSelectedPicture[i].location.longitude
        },
        "locationAccess": newSelectedPicture[i].locationAccess.value,
        "shotTime": newSelectedPicture[i].shotTime.value.millisecondsSinceEpoch
      };
    }
    await db.child("user/${userId.value}/selectedPicture").set(setData);
  }
}
