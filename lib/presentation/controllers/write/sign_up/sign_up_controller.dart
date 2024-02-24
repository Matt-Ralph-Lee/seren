import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/function/auth_service.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/backend/usecase/set_new_user_usecase.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  Future<void> build() async {}

  Future<void> execute(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await AuthService().signUp(email, password);
      // usecase
      final uid = ref.read(userIdProvider);
      await SetNewUserUsecase().execute(uid);
      // send email verification
      final user = ref.read(userProvider);
      if (user == null) throw Exception("Cannot find User");
      AuthService().sendVerificatinEmail(user);
    });
  }
}
