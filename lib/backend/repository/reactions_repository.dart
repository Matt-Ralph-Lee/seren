import 'package:seren/backend/model/friend_set.dart';
import 'package:seren/backend/model/property/memory_id.dart';
import 'package:seren/backend/model/property/reaction_path.dart';
import 'package:seren/backend/model/reaction.dart';
import 'package:seren/backend/model/reaction_set.dart';

import '../model/property/user_id.dart';
import 'database.dart';

class ReactionRepository {
  final rtdb = Database.realtimeDatabase;
  final store = Database.firestore;

  Future<void> setDefault(final UserId userId) async {
    await rtdb.child("user/${userId.value}/reactions").set({"hasValue": false});
  }

  Future<ReactionSet> getCommonFriendsReaction({
    required final UserId friendUserId,
    required final FriendSet friends,
    required final MemoryId memoryId,
  }) async {
    final event =
        await rtdb.child("user/${friendUserId.value}/reactions").once();
    final reactionsData = event.snapshot.value as Map<dynamic, dynamic>?;
    if (reactionsData == null) return ReactionSet({});

    final commonFriendsReaction = reactionsData.entries.where((entry) {
      final friendUserId = UserId(entry.key);
      return friends.contains(friendUserId);
    }).map((entry) {
      final reactionPath = ReactionPath(entry.value);
      final friendUserId = UserId(entry.key);
      return Reaction(
        memoryId: memoryId,
        reactedBy: friendUserId,
        reactionPath: reactionPath,
      );
    }).toSet();

    return ReactionSet(commonFriendsReaction);
  }

  Future<void> add(
      {required final Reaction reaction,
      required final UserId feedOwnerId}) async {
    await rtdb
        .child("user/${feedOwnerId.value}/reactions")
        .set({reaction.reactedBy.value: reaction.reactionPath.value});
    await store
        .collection("user")
        .doc(feedOwnerId.value)
        .collection("memories")
        .doc(reaction.memoryId.value)
        .update({
      "reactions": {reaction.reactedBy.value: reaction.reactionPath.value}
    });
  }
}
