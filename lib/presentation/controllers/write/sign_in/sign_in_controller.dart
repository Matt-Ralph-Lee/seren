import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/function/auth_service.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  Future<void> build() async {}

  Future<void> execute(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await AuthService().signIn(email, password);
    });
  }
}
