import '../model/property/user_id.dart';
import 'database.dart';

class FriendsRepository {
  final db = Database.realtimeDatabaes;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/friends").set({"hasValue": false});
  }
}
