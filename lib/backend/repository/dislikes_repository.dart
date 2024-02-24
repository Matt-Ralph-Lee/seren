import '../model/property/user_id.dart';
import 'database.dart';

class DisLikesRepository {
  final db = Database.realtimeDatabaes;

  Future<void> setDefault(final UserId userId) async {
    await db.child("user/${userId.value}/dislikes").set({"hasValue": false});
  }
}
