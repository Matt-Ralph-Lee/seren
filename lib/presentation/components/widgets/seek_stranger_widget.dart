import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seren/presentation/controllers/read/get_strangers/get_strangers_controller.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:seren/presentation/controllers/write/like_stranger/like_stranger_controller.dart';

import '../../shared/constants/page_path.dart';

class SeekStrangerWidget extends ConsumerWidget {
  const SeekStrangerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strangerDtoState = ref.watch(getStrangersControllerProvider);

    final strangerWidget = strangerDtoState.when(
      data: (strangerDtoList) {
        if (strangerDtoList.isEmpty) {
          return const Text(
            "theres no stranger around here",
            style: TextStyle(color: Colors.white),
          );
        }
        return AppinioSwiper(
          cardCount: strangerDtoList.length,
          onSwipeEnd: (previousIndex, targetIndex, activity) {
            ref.read(getStrangersControllerProvider.notifier).updateState();
            ref.read(likeStrangerControllerProvider.notifier).execute(
                strangerUid: strangerDtoList[previousIndex].uid,
                likedBy: strangerDtoList[previousIndex].likedBy);
            if (strangerDtoList[previousIndex].likedBy) {
              context.push(PagePath.matched);
            }
          },
          cardBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child:
                  Text("$index", style: const TextStyle(color: Colors.white)),
            );
          },
        );
      },
      error: (e, s) => Column(
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
      loading: () => const CircularProgressIndicator(),
    );

    return strangerWidget;
  }
}
