import 'package:seren/backend/model/friend_set.dart';

import '../model/property/user_id.dart';
import 'database.dart';

class FriendsRepository {
  final db = Database.realtimeDatabase;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/friends").set({"hasValue": false});
  }

  Future<FriendSet> getFriends(final UserId userId) async {
    final event = await db.child("user/${userId.value}/friends").once();
    final friendsData = event.snapshot.value as Map<dynamic, dynamic>?;
    if (friendsData == null) return FriendSet({});
    return FriendSet.fromRTDB(friendsData);
  }

  Future<int> getFriendCount(final UserId userId) async {
    final event = await db.child("user/${userId.value}/friends").once();
    final friendCount = event.snapshot.children.length;
    return friendCount;
  }

  Future<void> setFriends({
    required final UserId userId,
    required final UserId strangerUserId,
  }) async {
    await db.child("user").update({
      "${userId.value}/friends/${strangerUserId.value}": true,
      "${strangerUserId.value}/friends/${userId.value}": true,
    });
  }

  Future<bool> checkIsFriend({
    required final UserId userId,
    required final UserId otherUserId,
  }) async {
    final event = await db
        .child("user/${userId.value}/friends/${otherUserId.value}")
        .once();
    final friendsData = event.snapshot.value;
    return friendsData != null;
  }
}
