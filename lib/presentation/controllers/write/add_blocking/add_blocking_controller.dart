import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/add_blocking_usecase.dart';

part 'add_blocking_controller.g.dart';

@riverpod
class AddBlockingController extends _$AddBlockingController {
  @override
  Future<void> build() async {}

  Future<void> execute(final String targetUid) async {
    final uid = ref.read(userIdProvider);
    final addBlockingUsecase = AddBlockingUsecase();

    await addBlockingUsecase.execute(uid: uid, targetUid: targetUid);
  }
}
