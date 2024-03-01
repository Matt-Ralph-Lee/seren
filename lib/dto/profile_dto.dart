import 'package:seren/dto/picture_memory_dto.dart';

import 'gender_dto.dart';

class ProfileDto {
  final PictureMemoryDto _dailyPicture;
  final List<PictureMemoryDto> _selectedPicture;
  final String _username;
  final String _userIconPath;
  final GenderDto _gender;
  final String _shortIntro;
  final String _longIntro;
  final bool _isFriend;

  PictureMemoryDto get dailyPicture => _dailyPicture;
  List<PictureMemoryDto> get selectedPicture => _selectedPicture;
  String get username => _username;
  String get userIconPath => _userIconPath;
  GenderDto get gender => _gender;
  String get shortIntro => _shortIntro;
  String get longIntro => _longIntro;
  bool get isFriend => _isFriend;

  ProfileDto({
    required final PictureMemoryDto dailyPicture,
    required final List<PictureMemoryDto> selectedPicture,
    required final String username,
    required final String userIconPath,
    required final GenderDto gender,
    required final String shortIntro,
    required final String longIntro,
    required final bool isFriend,
  })  : _dailyPicture = dailyPicture,
        _selectedPicture = selectedPicture,
        _username = username,
        _userIconPath = userIconPath,
        _gender = gender,
        _shortIntro = shortIntro,
        _longIntro = longIntro,
        _isFriend = isFriend;
}
