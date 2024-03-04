class UserId {
  final String _value;

  String get value => _value;

  UserId(this._value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is UserId) {
      return runtimeType == other.runtimeType && _value == other._value;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => _value.hashCode;
}
