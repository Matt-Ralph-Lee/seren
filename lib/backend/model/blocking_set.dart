import 'property/user_id.dart';

class BlockingSet extends Iterable {
  final Set<UserId> _blockingSet;

  Set<UserId> get blockingSet => _blockingSet;

  BlockingSet(this._blockingSet);

  @override
  Iterator get iterator => _blockingSet.iterator;
}
