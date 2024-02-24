class ReactionPath {
  final String _value;

  String get value => _value;

  ReactionPath(this._value) {
    if (_validate(_value)) {
      throw Exception("invalid reaction path");
    }
  }

  bool _validate(String value) {
    return !value.contains("reaction");
  }
}
