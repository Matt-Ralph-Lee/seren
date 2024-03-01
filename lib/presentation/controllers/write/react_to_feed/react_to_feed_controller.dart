import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/react_to_feed_usecase.dart';

part 'react_to_feed_controller.g.dart';

@riverpod
class ReactToFeedController extends _$ReactToFeedController {
  @override
  Future<void> build() async {}

  Future<void> execute({
    required final String memoryId,
    required final String friendUid,
    required final String reactionPicturePath,
  }) async {
    final uid = ref.read(userIdProvider);
    final reactToFeedUsecase = ReactToFeedUsecase();

    await reactToFeedUsecase.execute(
      uid: uid,
      friendUid: friendUid,
      memoryIdData: memoryId,
      reactionPicturePath: reactionPicturePath,
    );
  }
}
