class Username {
  static const minLength = 3;
  static const maxLength = 12;
  final String _value;

  String get value => _value;

  Username(this._value) {
    if (_value.length < minLength || _value.length > maxLength) {
      throw Exception("invalid length");
    }
  }
}
