import 'package:seren/backend/model/property/gender.dart';

class GenderDto {
  final String _value;

  String get value => _value;

  GenderDto(this._value) {
    if (!GenderOption.values.any((gender) => gender.name == _value)) {
      throw Exception("invalid gender");
    }
  }
}
