import 'package:seren/backend/model/property/location_access.dart';

class LocationAccessDto {
  final String _value;

  String get value => _value;

  LocationAccessDto(this._value) {
    if (!LocationAccessOption.values.any((gender) => gender.name == _value)) {
      throw Exception("invalid location access");
    }
  }
}
