import 'package:seren/dto/picture_memory_dto.dart';

import 'reaction_dto.dart';

class FriendFeedDto {
  final String _uid;
  final String _userProfileIconPath;
  final String _username;
  final String _memoryId;
  final PictureMemoryDto _pictureMemory;
  final List<ReactionDto> _reactionList;

  String get uid => _uid;
  String get userProfileIconPath => _userProfileIconPath;
  String get username => _username;
  String get memoryId => _memoryId;
  PictureMemoryDto get pictureMemory => _pictureMemory;
  List<ReactionDto> get reactionList => _reactionList;

  FriendFeedDto({
    required final String uid,
    required final String userProfileIconPath,
    required final String username,
    required final String memoryId,
    required final PictureMemoryDto pictureMemory,
    required final List<ReactionDto> reactionList,
  })  : _uid = uid,
        _userProfileIconPath = userProfileIconPath,
        _username = username,
        _memoryId = memoryId,
        _pictureMemory = pictureMemory,
        _reactionList = reactionList;
}
