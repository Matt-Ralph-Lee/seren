import 'property/user_id.dart';

class BlockingList extends Iterable {
  final Set<UserId> _blockingList;

  Set<UserId> get blockingList => _blockingList;

  BlockingList(this._blockingList);

  @override
  Iterator get iterator => _blockingList.iterator;
}
