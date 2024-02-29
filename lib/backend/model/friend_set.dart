import 'property/user_id.dart';

class FriendSet extends Iterable<UserId> {
  final Set<UserId> _friendSet;

  Set<UserId> get friendSet => _friendSet;

  FriendSet(this._friendSet);

  @override
  Iterator<UserId> get iterator => _friendSet.iterator;
}
