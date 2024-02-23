class RetakeTime {
  static const minValue = 1;
  final int _value;

  int get value => _value;

  RetakeTime(this._value) {
    if (_value < minValue) {
      throw Exception("invalid retake time");
    }
  }
}
