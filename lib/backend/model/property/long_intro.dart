class LongIntro {
  static const maxLength = 150;
  final String _value;

  String get value => _value;

  LongIntro(this._value) {
    if (_value.length > maxLength) {
      throw Exception("invalid long intro length");
    }
  }
}
