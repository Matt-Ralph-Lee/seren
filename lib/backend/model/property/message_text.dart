class MessageText {
  static const maxLength = 144;
  final String _value;

  String get value => _value;

  MessageText(this._value) {
    if (_value.length > maxLength) {
      throw Exception("invalid message text length");
    }
    if (_value.isEmpty) {
      throw Exception("message text is empty");
    }
  }
}
