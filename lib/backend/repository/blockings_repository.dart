import 'package:seren/backend/model/blocking_set.dart';

import '../model/property/user_id.dart';
import 'database.dart';

class BlockingsRepository {
  final db = Database.realtimeDatabase;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/blockings").set({"hasValue": false});
  }

  Future<void> addBlockings({
    required final UserId userId,
    required final UserId targetUserId,
  }) async {
    await db
        .child("user/${userId.value}/blockings")
        .set({targetUserId.value: true});
  }

  Future<BlockingSet> getBlockings(final UserId userId) async {
    final event = await db.child("user/${userId.value}/blockings").once();
    final friendsData = event.snapshot.value as Map<dynamic, dynamic>?;
    if (friendsData == null) return BlockingSet({});
    return BlockingSet.fromRTDB(friendsData);
  }
}
