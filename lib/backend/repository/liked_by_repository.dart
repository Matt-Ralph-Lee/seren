import '../model/property/user_id.dart';
import 'database.dart';

class LikedByRepository {
  final db = Database.realtimeDatabaes;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/likedBy").set({"hasValue": false});
  }

  Future<void> set({
    required final UserId userId,
    required final UserId strangerUserId,
  }) async {
    await db.child("user/${strangerUserId.value}/likedBy").set({
      userId.value: {"seen": false}
    });
  }

  Future<void> updateLikedBySeen({
    required final UserId userId,
    required final UserId strangerUserId,
  }) async {
    await db.child("user/${userId.value}/likedBy").update({
      strangerUserId.value: {"seen": true}
    });
  }
}
