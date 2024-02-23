class PrimaryPath {
  final String _value;

  String get value => _value;

  PrimaryPath(this._value) {
    if (_validate(_value)) {
      throw Exception("invalid primary picture path");
    }
  }

  bool _validate(String value) {
    return !value.contains("memory/primary");
  }
}
