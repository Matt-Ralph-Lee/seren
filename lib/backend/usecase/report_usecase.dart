import 'package:seren/backend/model/property/report_text.dart';
import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/repository/report_repository.dart';

import '../model/report.dart';

class ReportUsecase {
  ReportUsecase._internal();

  static final ReportUsecase _cache = ReportUsecase._internal();

  factory ReportUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final String targetUid,
    required final String text,
  }) async {
    final userId = UserId(uid);
    final targetUserId = UserId(targetUid);
    final reportText = ReportText(text);

    final report =
        Report(userId: userId, targetUserId: targetUserId, text: reportText);

    final reportRepository = ReportRepository();

    await reportRepository.add(report);
  }
}
