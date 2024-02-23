enum GenderOption {
  male("male"),
  female("female"),
  other("other"),
  ;

  const GenderOption(this.name);

  final String name;
}

class Gender {
  final String _value;

  String get value => _value;

  Gender(this._value) {
    if (!GenderOption.values.any((gender) => gender.name == _value)) {
      throw Exception("invalid gender");
    }
  }
}
