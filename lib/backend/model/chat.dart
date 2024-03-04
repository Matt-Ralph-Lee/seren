import 'last_message.dart';
import 'property/chat_id.dart';
import 'property/user_icon_path.dart';
import 'property/username.dart';

class Chat {
  final ChatId _chatId;
  final UserIconPath _partnerIconPath;
  final Username _partnerName;
  final LastMessage _lastMessage;

  ChatId get chatId => _chatId;
  UserIconPath get partnerIconPath => _partnerIconPath;
  Username get partnerName => _partnerName;
  LastMessage get lastMessage => _lastMessage;

  Chat({
    required final ChatId chatId,
    required final UserIconPath partnerIconPath,
    required final Username partnerName,
    required final LastMessage lastMessage,
  })  : _chatId = chatId,
        _partnerIconPath = partnerIconPath,
        _partnerName = partnerName,
        _lastMessage = lastMessage;
}
