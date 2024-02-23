class ShortIntro {
  static const maxLength = 30;
  final String _value;

  String get value => _value;

  ShortIntro(this._value) {
    if (_value.length > maxLength) {
      throw Exception("invalid short intro length");
    }
  }
}
