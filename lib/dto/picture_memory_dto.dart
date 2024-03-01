import 'package:seren/backend/model/picture_memory.dart';
import 'package:seren/dto/location_access_dto.dart';

import 'location_dto.dart';

class PictureMemoryDto {
  final String _primaryPath;
  final String _secondaryPath;
  final LocationDto _location;
  final LocationAccessDto _locationAccess;
  final int _retakeTime;
  final DateTime _shotTime;

  String get primaryPath => _primaryPath;
  String get secondaryPath => _secondaryPath;
  LocationDto get location => _location;
  LocationAccessDto get locationAccess => _locationAccess;
  int get retakeTime => _retakeTime;
  DateTime get shotTime => _shotTime;

  PictureMemoryDto({
    required final String primaryPath,
    required final String secondaryPath,
    required final LocationDto location,
    required final LocationAccessDto locationAccess,
    required final int retakeTime,
    required final DateTime shotTime,
  })  : _primaryPath = primaryPath,
        _secondaryPath = secondaryPath,
        _location = location,
        _locationAccess = locationAccess,
        _retakeTime = retakeTime,
        _shotTime = shotTime;

  factory PictureMemoryDto.fromPictureMemory(
      final PictureMemory pictureMemory) {
    return PictureMemoryDto(
      primaryPath: pictureMemory.primaryPath.value,
      secondaryPath: pictureMemory.secondaryPath.value,
      location: LocationDto(
        latitude: pictureMemory.location.latitude,
        longitude: pictureMemory.location.longitude,
      ),
      locationAccess: LocationAccessDto(pictureMemory.locationAccess.value),
      retakeTime: pictureMemory.retakeTime.value,
      shotTime: pictureMemory.shotTime.value,
    );
  }
}
