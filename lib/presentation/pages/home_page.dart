import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seren/presentation/components/widgets/friends_feed_widget.dart';
import 'package:seren/presentation/components/widgets/seek_stranger_widget.dart';
import 'package:seren/presentation/components/widgets/user_icon_widget.dart';

import '../controllers/write/sign_out/sign_out_controller.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signOutState = ref.watch(signOutControllerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "seren",
          style: TextStyle(color: Colors.white),
        ),
        leading: const UserIconWidget(),
        actions: [
          IconButton(
            onPressed: signOutState.isLoading
                ? null
                : () async {
                    ref.read(signOutControllerProvider.notifier).execute();
                  },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "Friends"),
                Tab(text: "Seek"),
              ],
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white24,
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FriendsFeedWidget(),
                  SeekStrangerWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
