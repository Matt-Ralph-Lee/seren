import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seren/presentation/controllers/read/get_memories/get_memories_cotroller.dart';
import 'package:seren/presentation/shared/constants/page_path.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getMemoriesState = ref.watch(getMemoriesCotrollerProvider);

    final Widget body = getMemoriesState.when(
      data: (memories) {
        final result = memories.memories.entries
            .map(
              (e) => Column(
                children: [
                  Text(
                    e.value.memoryId,
                    style: const TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () => context.push(PagePath.memoryDetail(
                        targetMemoryId: e.value.memoryId)),
                    child: const Text(
                      "go detail memory",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
            .toList();
        return ListView(
          children: result,
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
      loading: () => const CircularProgressIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
      ),
    );
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Calendar",
        style: TextStyle(color: Colors.white),
      )),
      body: body,
    );
  }
}
