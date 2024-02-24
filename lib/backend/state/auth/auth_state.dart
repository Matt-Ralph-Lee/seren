import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

@riverpod
Stream<User?> userChanges(UserChangesRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}

@riverpod
User? user(UserRef ref) {
  final userChanges = ref.watch(userChangesProvider);
  return userChanges.when(
      data: (d) => d, error: (_, __) => null, loading: () => null);
}

@riverpod
bool isSignedIn(IsSignedInRef ref) {
  final user = ref.watch(userProvider);
  return user != null;
}

@riverpod
String userId(UserIdRef ref) {
  final user = ref.watch(userProvider);
  return user!.uid;
}
