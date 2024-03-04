class ChatIdDto {
  final String _value;
  final bool _exists;

  String get value => _value;
  bool get exists => _exists;

  ChatIdDto({
    required final String value,
    required final bool exists,
  })  : _value = value,
        _exists = exists;
}
