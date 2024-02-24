class SecondaryPath {
  final String _value;

  String get value => _value;

  SecondaryPath(this._value) {
    if (_validate(_value)) {
      throw Exception("invalid secondary picture path");
    }
  }

  bool _validate(String value) {
    return !value.contains("secondary");
  }
}
