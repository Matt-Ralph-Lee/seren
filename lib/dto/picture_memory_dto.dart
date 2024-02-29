import 'location_dto.dart';

class PictureMemoryDto {
  final String _primaryPath;
  final String _secondaryPath;
  final LocationDto _location;
  final int _retakeTime;
  final DateTime _shotTime;

  String get primaryPath => _primaryPath;
  String get secondaryPath => _secondaryPath;
  LocationDto get location => _location;
  int get retakeTime => _retakeTime;
  DateTime get shotTime => _shotTime;

  PictureMemoryDto({
    required final String primaryPath,
    required final String secondaryPath,
    required final LocationDto location,
    required final int retakeTime,
    required final DateTime shotTime,
  })  : _primaryPath = primaryPath,
        _secondaryPath = secondaryPath,
        _location = location,
        _retakeTime = retakeTime,
        _shotTime = shotTime;
}
