import 'package:seren/backend/model/property/memory_id.dart';

import 'primary_path.dart';

class Memory {
  final MemoryId _memoryId;
  final PrimaryPath _primaryPath;

  PrimaryPath get primaryPath => _primaryPath;
  MemoryId get memoryId => _memoryId;

  Memory({
    required final MemoryId memoryId,
    required final PrimaryPath primaryPath,
  })  : _memoryId = memoryId,
        _primaryPath = primaryPath;
}
