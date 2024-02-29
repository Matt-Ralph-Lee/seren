import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/presentation/routers/router.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    ref.listen(isSignedInProvider, (_, __) {
      router.refresh();
    });
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: const ColorScheme(
          background: Colors.transparent,
          brightness: Brightness.dark,
          primary: Colors.transparent,
          onPrimary: Colors.transparent,
          secondary: Colors.transparent,
          onSecondary: Colors.transparent,
          error: Colors.transparent,
          onError: Colors.transparent,
          onBackground: Colors.transparent,
          surface: Colors.transparent,
          onSurface: Colors.transparent,
        ), // colorScheme,
        useMaterial3: true,
      ),
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
