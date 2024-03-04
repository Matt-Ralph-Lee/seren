import 'property/last_message_text.dart';
import 'property/user_id.dart';

class LastMessage {
  final LastMessageText _messageText;
  final UserId _sentBy;
  final bool _seen;
  final DateTime _sentAt;

  LastMessageText get messageText => _messageText;
  UserId get sentBy => _sentBy;
  bool get seen => _seen;
  DateTime get sentAt => _sentAt;

  LastMessage({
    required final LastMessageText messageText,
    required final UserId sentBy,
    required final bool seen,
    required final DateTime sentAt,
  })  : _messageText = messageText,
        _sentBy = sentBy,
        _seen = seen,
        _sentAt = sentAt;

  factory LastMessage.fromRTDB(final Map<dynamic, dynamic> data) {
    return LastMessage(
      messageText: LastMessageText(data["message"]),
      sentBy: UserId(data["sentBy"]),
      seen: data["seen"],
      sentAt: DateTime.fromMillisecondsSinceEpoch(data["timestamp"]),
    );
  }
}
