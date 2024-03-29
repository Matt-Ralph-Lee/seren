import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seren/backend/function/auth_service.dart';
import 'package:seren/backend/state/auth/auth_state.dart';
import 'package:seren/presentation/pages/calendar_page.dart';
import 'package:seren/presentation/pages/chat_list_page.dart';
import 'package:seren/presentation/pages/chat_room_page.dart';
import 'package:seren/presentation/pages/email_verification_page.dart';
import 'package:seren/presentation/pages/friend_list_page.dart';
import 'package:seren/presentation/pages/home_page.dart';
import 'package:seren/presentation/pages/initial_user_setting_page.dart';
import 'package:seren/presentation/pages/matched_page.dart';
import 'package:seren/presentation/pages/memory_detail_page.dart';
import 'package:seren/presentation/pages/my_profile_page.dart';
import 'package:seren/presentation/pages/permission_request_page.dart';
import 'package:seren/presentation/pages/profile_page.dart';
import 'package:seren/presentation/pages/sign_in_page.dart';
import 'package:seren/presentation/pages/sign_up_page.dart';
import 'package:seren/presentation/routers/shell.dart';
import 'package:seren/presentation/shared/constants/page_path.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final routes = [
    GoRoute(
      path: PagePath.signIn,
      builder: (_, __) => const SignInPage(),
    ),
    GoRoute(
      path: PagePath.signUp,
      builder: (_, __) => const SignUpPage(),
    ),
    GoRoute(
      path: PagePath.emailVerification,
      builder: (_, __) => const EmailVerificationPage(),
    ),
    GoRoute(
      path: PagePath.initialUserSetting,
      builder: (_, __) => const InitialUserSettingPage(),
    ),
    GoRoute(
      path: PagePath.permissionRequest,
      builder: (_, __) => const PermissionRequestPage(),
    ),
    ShellRoute(
      builder: (_, __, child) => Shell(child: child),
      routes: [
        GoRoute(
          path: PagePath.initial,
          builder: (_, __) => const HomePage(),
        ),
        GoRoute(
          path: PagePath.matched,
          builder: (_, __) => const MatchedPage(),
        ),
        GoRoute(
          path: PagePath.profile(),
          builder: (context, state) => ProfilePage(
            targetUid: state.pathParameters["targetUid"]!,
          ),
        ),
        GoRoute(
          path: PagePath.myProfile,
          builder: (_, __) => const MyProfilePage(),
        ),
        GoRoute(
          path: PagePath.calendar,
          builder: (_, __) => const CalendarPage(),
        ),
        GoRoute(
          path: PagePath.memoryDetail(),
          builder: (context, state) => MemoryDetailPage(
            targetMemoryId: state.pathParameters["targetMemoryId"]!,
          ),
        ),
        GoRoute(
          path: PagePath.chatList,
          builder: (_, __) => const ChatListPage(),
        ),
        GoRoute(
          path: PagePath.friendList,
          builder: (_, __) => const FriendListPage(),
        ),
        GoRoute(
          path: PagePath.chatRoom(),
          builder: (context, state) => ChatRoomPage(
            chatId: state.pathParameters["chatId"]!,
          ),
        )
      ],
    )
  ];

  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final pagePath = state.uri.toString();
    final isSignedIn = ref.read(isSignedInProvider);

    final isEmailVerified = await AuthService().isEmailVerified();

    if (isSignedIn) {
      if (!isEmailVerified) {
        return PagePath.emailVerification;
      }
      if (_isAuthPage(pagePath)) {
        return PagePath.initial;
      }
    } else if (!isSignedIn & !_isAuthPage(pagePath)) {
      return PagePath.signIn;
    }
    return null;
  }

  return GoRouter(
    initialLocation: PagePath.initial,
    routes: routes,
    redirect: redirect,
  );
}

bool _isAuthPage(final String path) {
  final paths = [PagePath.signIn, PagePath.signUp];

  return paths.contains(path);
}
