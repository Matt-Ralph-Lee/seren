import 'picture_memory_dto.dart';

class StrangerDto {
  final String _uid;
  final String _username;
  final String _shortIntro;
  final PictureMemoryDto _dailyPicture;
  final List<PictureMemoryDto> _selectedPicture;
  final bool _likedBy;

  String get uid => _uid;
  String get username => _username;
  String get shortIntro => _shortIntro;
  PictureMemoryDto get dailyPicture => _dailyPicture;
  List<PictureMemoryDto> get selectedPicture => _selectedPicture;
  bool get likedBy => _likedBy;

  StrangerDto({
    required final String uid,
    required final String username,
    required final String shortIntro,
    required final PictureMemoryDto dailyPicture,
    required final List<PictureMemoryDto> selectedPicture,
    required final bool likedBy,
  })  : _uid = uid,
        _username = username,
        _shortIntro = shortIntro,
        _dailyPicture = dailyPicture,
        _selectedPicture = selectedPicture,
        _likedBy = likedBy;
}
