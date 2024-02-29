import 'reaction.dart';

class ReactionSet extends Iterable<Reaction> {
  final Set<Reaction> _reactionSet;

  Set<Reaction> get reactionSet => _reactionSet;

  ReactionSet(this._reactionSet);

  @override
  Iterator<Reaction> get iterator => _reactionSet.iterator;
}
