import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seren/backend/model/property/memory_id.dart';
import 'package:seren/backend/model/property/primary_path.dart';

import 'property/memory.dart';
import 'property/shot_time.dart';

class MemoryMap {
  final Map<ShotTime, Memory> _memoryMap;

  Map<ShotTime, Memory> get memoryMap => _memoryMap;

  MemoryMap(this._memoryMap);

  factory MemoryMap.fromStore(final Map<String, dynamic> data) {
    final Map<ShotTime, Memory> memoryMap = {};
    data.forEach((key, value) {
      final memory = Memory(
        memoryId: MemoryId(key),
        primaryPath: PrimaryPath(value["primaryPath"]),
      );
      final shotTime = ShotTime((value["shotTime"] as Timestamp).toDate());
      memoryMap[shotTime] = memory;
    });

    return MemoryMap(memoryMap);
  }
}
