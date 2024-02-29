import 'property/memory.dart';
import 'property/shot_time.dart';

class MemoryMap {
  final Map<ShotTime, Memory> _memoryMap;

  Map<ShotTime, Memory> get memoryMap => _memoryMap;

  MemoryMap(this._memoryMap);
}
