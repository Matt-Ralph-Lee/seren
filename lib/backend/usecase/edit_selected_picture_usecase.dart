import 'package:seren/backend/model/picture_memory.dart';
import 'package:seren/backend/model/property/user_id.dart';
import 'package:seren/backend/model/selected_picture.dart';
import 'package:seren/backend/repository/selected_picture_repository.dart';

class EditSelectedPictureUsecase {
  EditSelectedPictureUsecase._internal();

  static final EditSelectedPictureUsecase _cache =
      EditSelectedPictureUsecase._internal();

  factory EditSelectedPictureUsecase() => _cache;

  Future<void> execute({
    required final String uid,
    required final List<String> newSelectedPictureData,
  }) async {
    final userId = UserId(uid);
    final newSelectedPicture = <PictureMemory>[];

    final selectedPictureRepository = SelectedPictureRepository();

    await selectedPictureRepository.edit(
      userId: userId,
      newSelectedPicture: SelectedPicture(newSelectedPicture),
    );
  }
}
