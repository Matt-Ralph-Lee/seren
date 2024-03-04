class LastMessageText {
  static const maxLength = 144;
  final String _value;

  String get value => _value;

  LastMessageText(this._value) {
    if (_value.length > maxLength) {
      throw Exception("invalid message text length");
    }
  }
}
