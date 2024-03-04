import 'property/message_text.dart';
import 'property/user_id.dart';

class Message {
  final MessageText _messageText;
  final UserId _sentBy;
  final bool _seen;
  final DateTime _sentAt;

  MessageText get messageText => _messageText;
  UserId get sentBy => _sentBy;
  bool get seen => _seen;
  DateTime get sentAt => _sentAt;

  Message({
    required final MessageText messageText,
    required final UserId sentBy,
    required final bool seen,
    required final DateTime sentAt,
  })  : _messageText = messageText,
        _sentBy = sentBy,
        _seen = seen,
        _sentAt = sentAt;

  factory Message.fromRTDB(final Map<dynamic, dynamic> data) {
    return Message(
      messageText: MessageText(data["message"]),
      sentBy: UserId(data["sentBy"]),
      seen: data["seen"],
      sentAt: DateTime.fromMillisecondsSinceEpoch(data["timestamp"]),
    );
  }
}
