import 'reaction.dart';

class ReactionSet extends Iterable {
  final Set<Reaction> _reactionSet;

  Set<Reaction> get reactionSet => _reactionSet;

  ReactionSet(this._reactionSet);

  @override
  Iterator get iterator => _reactionSet.iterator;
}
