import '../model/property/user_id.dart';
import 'database.dart';

class LikesRepository {
  final db = Database.realtimeDatabaes;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/likes").set({"hasValue": false});
  }

  Future<void> set({
    required final UserId userId,
    required final UserId strangerUserId,
  }) async {
    await db
        .child("user/${userId.value}/likes")
        .set({strangerUserId.value: true});
  }
}
