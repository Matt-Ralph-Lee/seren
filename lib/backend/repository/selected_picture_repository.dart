import 'package:seren/backend/model/selected_picture.dart';

import '../model/property/user_id.dart';
import 'database.dart';

class SelectedPictureRepository {
  final db = Database.realtimeDatabaes;

  Future<void> setDefault(final UserId userId) async {
    await db
        .child("user/${userId.value}/selectedPicture")
        .set({"hasValue": false});
  }

  Future<SelectedPicture> get(final UserId userId) async {
    final event = await db.child("user/${userId.value}/selectedPicture").once();
    final selectedPictureData = event.snapshot.value as Map<String, dynamic>?;
    if (selectedPictureData == null) return SelectedPicture({});
    return SelectedPicture.fromRTDB(selectedPictureData);
  }
}
