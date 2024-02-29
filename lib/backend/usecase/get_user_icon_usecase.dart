import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/dto/user_icon_dto.dart';

import '../repository/identity_repository.dart';

class GetUserIconUsecase {
  GetUserIconUsecase._internal();

  static final GetUserIconUsecase _cache = GetUserIconUsecase._internal();

  factory GetUserIconUsecase() => _cache;

  Future<UserIconDto> execute(final String uid) async {
    final identityRepository = IdentityRepository();
    final userIconPath = await identityRepository.getUserIconPath(UserId(uid));
    final userIconDto = UserIconDto(userIconPath.value);
    return userIconDto;
  }
}
