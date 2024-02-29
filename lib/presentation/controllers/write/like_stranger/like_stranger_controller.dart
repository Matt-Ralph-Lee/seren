import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/like_stranger_usecase.dart';

part 'like_stranger_controller.g.dart';

@riverpod
class LikeStrangerController extends _$LikeStrangerController {
  @override
  Future<void> build() async {}

  Future<void> execute(
      {required final String strangerUid, required final bool likedBy}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final uid = ref.read(userIdProvider);
      final likeStrangerUsecase = LikeStrangerUsecase();
      await likeStrangerUsecase.execute(
        uid: uid,
        strangerUid: strangerUid,
        likedBy: likedBy,
      );
    });
  }
}
