import 'property/user_icon_path.dart';
import 'property/username.dart';
import 'message.dart';

class Chat {
  final UserIconPath _partnerIconPath;
  final Username _partnerName;
  final Message _lastMessage;

  UserIconPath get partnerIconPath => _partnerIconPath;
  Username get partnerName => _partnerName;
  Message get lastMessage => _lastMessage;

  Chat({
    required final UserIconPath partnerIconPath,
    required final Username partnerName,
    required final Message lastMessage,
  })  : _partnerIconPath = partnerIconPath,
        _partnerName = partnerName,
        _lastMessage = lastMessage;
}
