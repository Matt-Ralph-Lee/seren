class Location {
  final double _latitude;
  final double _longitude;

  double get latitude => _latitude;
  double get longitude => _longitude;

  Location({
    required final double latitude,
    required final double longitude,
  })  : _latitude = latitude,
        _longitude = longitude;
}
