import 'property/shot_time.dart';
import 'property/location.dart';
import 'property/location_access.dart';
import 'property/memory_id.dart';
import 'property/primary_path.dart';
import 'property/retake_time.dart';
import 'property/secondary_path.dart';

class PictureMemory {
  final ShotTime _shotTime;
  final MemoryId _memoryId;
  final PrimaryPath _primaryPath;
  final SecondaryPath _secondaryPath;
  final Location _location;
  final LocationAccess _locationAccess;
  final RetakeTime _retakeTime;

  ShotTime get shotTime => _shotTime;
  MemoryId get memoryId => _memoryId;
  PrimaryPath get primaryPath => _primaryPath;
  SecondaryPath get secondaryPath => _secondaryPath;
  Location get location => _location;
  LocationAccess get locationAccess => _locationAccess;
  RetakeTime get retakeTime => _retakeTime;

  PictureMemory({
    required final ShotTime shotTime,
    required final MemoryId memoryId,
    required final PrimaryPath primaryPath,
    required final SecondaryPath secondaryPath,
    required final Location location,
    required final LocationAccess locationAccess,
    required final RetakeTime retakeTime,
  })  : _shotTime = shotTime,
        _memoryId = memoryId,
        _primaryPath = primaryPath,
        _secondaryPath = secondaryPath,
        _location = location,
        _locationAccess = locationAccess,
        _retakeTime = retakeTime;

  factory PictureMemory.fromRTDB(final Map<dynamic, dynamic> data) {
    return PictureMemory(
      shotTime: ShotTime(DateTime.fromMillisecondsSinceEpoch(data["shotTime"])),
      memoryId: MemoryId(data["memoryId"]),
      primaryPath: PrimaryPath(data["primaryPicturePath"]),
      secondaryPath: SecondaryPath(data["secondaryPicturePath"]),
      location: Location(
        latitude: data["location"]["latitude"].runtimeType == int
            ? (data["location"]["latitude"] as int).toDouble()
            : data["location"]["latitude"],
        longitude: data["location"]["longitude"].runtimeType == int
            ? (data["location"]["longitude"] as int).toDouble()
            : data["location"]["longitude"],
      ),
      locationAccess: LocationAccess(data["locationAccess"]),
      retakeTime: RetakeTime(data["retakeTime"]),
    );
  }
}
