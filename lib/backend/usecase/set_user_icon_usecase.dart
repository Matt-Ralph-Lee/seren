import 'package:seren/backend/model/property/user_id.dart';

import '../repository/storage_repository.dart';

class SetUserIconUsecase {
  SetUserIconUsecase._internal();

  static final SetUserIconUsecase _cache = SetUserIconUsecase._internal();

  factory SetUserIconUsecase() => _cache;

  Future<String> execute(
      final String uid, final String userIconPathData) async {
    final storageRepository = StorageRepository();
    final userId = UserId(uid);
    final userIconPath = await storageRepository.setUserIcon(
      userId: userId,
      filePath: userIconPathData,
    );
    return userIconPath;
  }
}
