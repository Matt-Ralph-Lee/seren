import 'picture_memory.dart';

class SelectedPicture extends Iterable<PictureMemory> {
  static const maxLength = 3;
  final Set<PictureMemory> _pictureMemorySet;

  Set<PictureMemory> get pictureMemorySet => _pictureMemorySet;

  SelectedPicture(this._pictureMemorySet) {
    if (_pictureMemorySet.length > maxLength) {
      throw Exception("invalid number of selected picture");
    }
  }

  factory SelectedPicture.fromRTDB(final Map<String, dynamic> data) {
    final pictureMemorySet =
        data.values.map((e) => PictureMemory.fromRTDB(e)).toSet();
    return SelectedPicture(pictureMemorySet);
  }

  @override
  Iterator<PictureMemory> get iterator => _pictureMemorySet.iterator;
}
