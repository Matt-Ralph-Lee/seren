class UserIconPath {
  final String _value;

  String get value => _value;

  UserIconPath(this._value) {
    if (_validate(_value)) {
      throw Exception("invalid user icon path");
    }
  }

  bool _validate(value) {
    return !value.contains("userIcon");
  }
}
