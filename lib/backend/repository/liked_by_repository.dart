import '../model/property/user_id.dart';
import 'database.dart';

class LikedByRepository {
  final db = Database.realtimeDatabase;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/likedBy").set({"hasValue": false});
  }

  Future<void> set({
    required final UserId userId,
    required final UserId strangerUserId,
  }) async {
    final strangerBlockingMe = await db
        .child("user/${strangerUserId.value}/blockings/${userId.value}")
        .once();
    if (strangerBlockingMe.snapshot.exists) return;
    await db
        .child("user/${strangerUserId.value}/likedBy")
        .set({userId.value: true});
  }

  Future<void> delete({
    required final UserId userId,
    required final UserId strangerUserId,
  }) async {
    await db
        .child("user/${userId.value}/likedBy/${strangerUserId.value}")
        .remove();
  }
}
