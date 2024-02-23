import 'memory_id.dart';
import 'user_id.dart';

class Reaction {
  final MemoryId _memoryId;
  final UserId _reactedBy;

  MemoryId get memoryId => _memoryId;
  UserId get reactedBy => _reactedBy;

  Reaction({
    required final MemoryId memoryId,
    required final UserId reactedBy,
  })  : _memoryId = memoryId,
        _reactedBy = reactedBy;
}
