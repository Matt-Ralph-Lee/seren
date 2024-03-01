import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seren/presentation/controllers/read/get_friend_feed_list/get_friend_feed_list_controller.dart';
import 'package:seren/presentation/controllers/read/get_my_daily_picture/get_my_daily_picture_controller.dart';
import 'package:seren/presentation/controllers/write/react_to_feed/react_to_feed_controller.dart';

class FriendsFeedWidget extends ConsumerWidget {
  const FriendsFeedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myDailyPictureState = ref.watch(getMyDailyPictureControllerProvider);
    final friendFeedState = ref.watch(getFriendFeedListControllerProvider);

    final Widget myDailyPictureWidget = myDailyPictureState.when(
      data: (myDailyPicture) {
        return SizedBox(
          width: 100,
          height: 200,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.network(
              myDailyPicture.picturePath,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
      error: (e, s) => Text(
        "$e",
        style: const TextStyle(color: Colors.white),
      ),
      loading: () => const CircularProgressIndicator(),
    );

    final Widget friendFeedListWidget = friendFeedState.when(
      data: (friendFeedList) {
        print(friendFeedList.length);
        return Expanded(
          child: ListView(
            children: [
              for (final friendFeed in friendFeedList)
                Column(
                  children: [
                    Text(
                      friendFeed.memoryId,
                      style: const TextStyle(color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () => ref
                          .read(reactToFeedControllerProvider.notifier)
                          .execute(
                              memoryId: friendFeed.memoryId,
                              friendUid: friendFeed.uid,
                              reactionPicturePath: "reactionPicturePathHoge"),
                      child: const Text(
                        "React",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
            ],
          ),
        );
      },
      error: (e, s) => Expanded(
        child: ListView(
          children: [
            Text(
              "$e",
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              "$s",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      loading: () => const CircularProgressIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
      ),
    );

    return Column(
      children: [
        myDailyPictureWidget,
        friendFeedListWidget,
      ],
    );
  }
}
