import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seren/presentation/controllers/read/get_memory_detail/get_memory_detail_controller.dart';

class MemoryDetailPage extends ConsumerWidget {
  const MemoryDetailPage({
    super.key,
    required this.targetMemoryId,
  });

  final String targetMemoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getMemoryDetailState =
        ref.watch(getMemoryDetailControllerProvider(targetMemoryId));

    final Widget body = getMemoryDetailState.when(
      data: (memory) => Text(
        memory.pictureMemory.primaryPath,
        style: const TextStyle(color: Colors.white),
      ),
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
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "memory page",
        style: TextStyle(color: Colors.white),
      )),
      body: body,
    );
  }
}
