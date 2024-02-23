enum LocationAccessOption {
  public("public"),
  friend("friend only"),
  private("private"),
  ;

  const LocationAccessOption(this.name);

  final String name;
}

class LocationAccess {
  final String _value;

  String get value => _value;

  LocationAccess(this._value) {
    if (!LocationAccessOption.values.any((gender) => gender.name == _value)) {
      throw Exception("invalid location access");
    }
  }
}
