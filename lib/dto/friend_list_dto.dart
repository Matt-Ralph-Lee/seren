import 'package:seren/dto/friend_dto.dart';

class FriendListDto extends Iterable<FriendDto> {
  final List<FriendDto> _friendList;

  List<FriendDto> get friendList => _friendList;

  FriendListDto(this._friendList);

  @override
  Iterator<FriendDto> get iterator => _friendList.iterator;
}
