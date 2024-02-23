import 'property/user_icon_path.dart';
import 'property/user_id.dart';
import 'property/username.dart';

class Identity {
  final UserId _userId;
  final Username _username;
  final UserIconPath _userIconPath;

  UserId get userId => _userId;
  Username get username => _username;
  UserIconPath get userIconPath => _userIconPath;

  Identity({
    required final UserId userId,
    required final Username username,
    required final UserIconPath userIconPath,
  })  : _userId = userId,
        _username = username,
        _userIconPath = userIconPath;
}
