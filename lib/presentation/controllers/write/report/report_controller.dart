import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/report_usecase.dart';

part 'report_controller.g.dart';

@riverpod
class ReportController extends _$ReportController {
  @override
  Future<void> build() async {}

  Future<void> execute({
    required final String targetUid,
    required final String text,
  }) async {
    final uid = ref.read(userIdProvider);
    final reportUsecase = ReportUsecase();

    await reportUsecase.execute(uid: uid, targetUid: targetUid, text: text);
  }
}
