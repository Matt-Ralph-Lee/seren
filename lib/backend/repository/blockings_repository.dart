import 'package:seren/backend/model/blocking_set.dart';

import '../model/property/user_id.dart';
import 'database.dart';

class BlockingsRepository {
  final db = Database.realtimeDatabaes;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/blockings").set({"hasValue": false});
  }

  Future<BlockingSet> getBlockings(final UserId userId) async {
    final event = await db.child("user/${userId.value}/friends").once();
    final friendsData = Map<String, bool>.from(event.snapshot.value as dynamic);
    if (friendsData == null) return BlockingSet({});
    return BlockingSet.fromRTDB(friendsData);
  }
}
