import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seren/backend/state/auth/auth_state.dart';

class Shell extends ConsumerWidget {
  const Shell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn = ref.watch(isSignedInProvider);

    if (isSignedIn) {
      return child;
    } else {
      return const CircularProgressIndicator();
    }
  }
}
