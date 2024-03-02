import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seren/dto/location_access_dto.dart';
import 'package:seren/dto/location_dto.dart';
import 'package:seren/dto/picture_memory_dto.dart';
import 'package:seren/dto/reaction_dto.dart';

class MemoryDetailDto {
  final PictureMemoryDto _pictureMemory;
  final List<ReactionDto> _reactionList;

  PictureMemoryDto get pictureMemory => _pictureMemory;
  List<ReactionDto> get reactionList => _reactionList;

  MemoryDetailDto({
    required final PictureMemoryDto pictureMemory,
    required final List<ReactionDto> reactionList,
  })  : _pictureMemory = pictureMemory,
        _reactionList = reactionList;

  factory MemoryDetailDto.fromStore(final Map<String, dynamic> data) {
    final pictureMemory = PictureMemoryDto(
      primaryPath: data["primaryPath"],
      secondaryPath: data["secondaryPath"],
      location: LocationDto(
        latitude: data["location"]["latitude"],
        longitude: data["location"]["longitude"],
      ),
      locationAccess: LocationAccessDto(data["locationAccess"]),
      retakeTime: data["retakeTime"],
      shotTime: (data["shotTime"] as Timestamp).toDate(),
    );
    final reactionList = (data["reactions"] as Map<String, dynamic>)
        .entries
        .map(
            (e) => ReactionDto(reactedUid: e.key, reactionPicturePath: e.value))
        .toList();

    return MemoryDetailDto(
        pictureMemory: pictureMemory, reactionList: reactionList);
  }
}
