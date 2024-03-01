import 'property/user_id.dart';

class BlockingSet extends Iterable {
  final Set<UserId> _blockingSet;

  Set<UserId> get blockingSet => _blockingSet;

  BlockingSet(this._blockingSet);

  @override
  Iterator get iterator => _blockingSet.iterator;

  factory BlockingSet.fromRTDB(final Map<dynamic, dynamic> data) {
    final blockingSet = data.keys.map((e) => UserId(e)).toSet();
    return BlockingSet(blockingSet);
  }
}
