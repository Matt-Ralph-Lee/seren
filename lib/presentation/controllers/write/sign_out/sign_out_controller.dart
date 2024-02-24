import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/function/auth_service.dart';

part 'sign_out_controller.g.dart';

@riverpod
class SignOutController extends _$SignOutController {
  @override
  Future<void> build() async {}

  Future<void> execute() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await AuthService().signOut();
    });
  }
}
