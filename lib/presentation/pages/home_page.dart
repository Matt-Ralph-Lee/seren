import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seren/presentation/components/widgets/friends_feed_widget.dart';
import 'package:seren/presentation/components/widgets/seek_stranger_widget.dart';
import 'package:seren/presentation/components/widgets/user_icon_widget.dart';
import 'package:seren/presentation/shared/constants/page_path.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () => context.push(PagePath.chatList),
            icon: const Icon(
              Icons.people,
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
