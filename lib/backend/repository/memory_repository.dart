import '../model/property/user_id.dart';
import 'database.dart';

class MemoryRepository {
  final db = Database.firestore;

  Future<void> setDefault(final UserId userId) async {
    await db.collection("user").doc(userId.value).set({"memories": {}});
  }
}
