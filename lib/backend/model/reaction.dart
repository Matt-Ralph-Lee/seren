import 'property/reaction_path.dart';
import 'property/memory_id.dart';
import 'property/user_id.dart';

class Reaction {
  final MemoryId _memoryId;
  final UserId _reactedBy;
  final ReactionPath _reactionPath;

  MemoryId get memoryId => _memoryId;
  UserId get reactedBy => _reactedBy;
  ReactionPath get reactionPath => _reactionPath;

  Reaction({
    required final MemoryId memoryId,
    required final UserId reactedBy,
    required final ReactionPath reactionPath,
  })  : _memoryId = memoryId,
        _reactedBy = reactedBy,
        _reactionPath = reactionPath;
}
