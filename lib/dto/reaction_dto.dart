class ReactionDto {
  final String _reactedUid;
  final String _reactionPicturePath;

  String get reactedUid => _reactedUid;
  String get reactionPicturePath => _reactionPicturePath;

  ReactionDto({
    required final String reactedUid,
    required final String reactionPicturePath,
  })  : _reactedUid = reactedUid,
        _reactionPicturePath = reactionPicturePath;
}
