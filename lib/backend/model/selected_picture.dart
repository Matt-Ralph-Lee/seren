import 'picture_memory.dart';

class SelectedPicture extends Iterable {
  static const maxLength = 3;
  final Set<PictureMemory> _pictureMemorySet;

  Set<PictureMemory> get pictureMemorySet => _pictureMemorySet;

  SelectedPicture(this._pictureMemorySet) {
    if (_pictureMemorySet.length > maxLength) {
      throw Exception("invalid number of selected picture");
    }
  }

  @override
  Iterator get iterator => throw _pictureMemorySet.iterator;
}
