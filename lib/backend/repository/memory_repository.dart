import 'package:seren/backend/model/memory_map.dart';
import 'package:seren/backend/model/property/memory_id.dart';
import 'package:seren/dto/memory_detail_dto.dart';

import '../model/property/user_id.dart';
import 'database.dart';

class MemoryRepository {
  final db = Database.firestore;

  Future<void> setDefault(final UserId userId) async {
    await db.collection("user").doc(userId.value).set({"memories": {}});
  }

  Future<MemoryMap> getMemories(final UserId userId) async {
    final docSnapshot = await db.collection("user").doc(userId.value).get();
    final data = docSnapshot.data();
    if (data == null) return MemoryMap({});
    return MemoryMap.fromStore(data["memories"]);
  }

  Future<MemoryDetailDto> getMemoryDetail({
    required final UserId userId,
    required final MemoryId memoryId,
  }) async {
    final docSnapshot = await db
        .collection("user")
        .doc(userId.value)
        .collection("memories")
        .doc(memoryId.value)
        .get();

    final data = docSnapshot.data();
    if (data == null) throw Exception("cannot find memory");
    return MemoryDetailDto.fromStore(data);
  }
}
