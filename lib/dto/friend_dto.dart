class FriendDto {
  final String _uid;
  final String _iconpath;
  final String _name;

  String get uid => _uid;
  String get friendIconPath => _iconpath;
  String get friendName => _name;

  FriendDto({
    required final String uid,
    required final String iconPath,
    required final String name,
  })  : _uid = uid,
        _iconpath = iconPath,
        _name = name;
}
