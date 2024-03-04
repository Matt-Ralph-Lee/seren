import '../model/report.dart';
import 'database.dart';

class ReportRepository {
  final store = Database.firestore;

  Future<void> add(final Report report) async {
    await store.collection("report").add({
      "text": report.text.value,
      "target": report.targetUserId.value,
      "sentBy": report.userId.value,
      "solved": false,
    });
  }
}
