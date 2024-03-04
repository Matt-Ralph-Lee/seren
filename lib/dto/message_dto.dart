class MessageDto {
  final String _messageText;
  final String _sentBy;
  final bool _seen;
  final DateTime _sentAt;

  String get messageText => _messageText;
  String get sentBy => _sentBy;
  bool get seen => _seen;
  DateTime get sentAt => _sentAt;

  MessageDto({
    required final String messageText,
    required final String sentBy,
    required final bool seen,
    required final DateTime sentAt,
  })  : _messageText = messageText,
        _sentBy = sentBy,
        _seen = seen,
        _sentAt = sentAt;
}
