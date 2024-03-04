import 'picture_memory.dart';

class SelectedPicture extends Iterable<PictureMemory> {
  static const maxLength = 3;
  final List<PictureMemory> _pictureMemoryList;

  List<PictureMemory> get pictureMemorySet => _pictureMemoryList;

  SelectedPicture(this._pictureMemoryList) {
    if (_pictureMemoryList.length > maxLength) {
      throw Exception("invalid number of selected picture");
    }
    if (_pictureMemoryList.toSet().length != _pictureMemoryList.length) {
      throw Exception("duplicated picture");
    }
  }

  factory SelectedPicture.fromRTDB(final Map<String, dynamic> data) {
    final pictureMemorySet =
        data.values.map((e) => PictureMemory.fromRTDB(e)).toList();
    return SelectedPicture(pictureMemorySet);
  }

  @override
  Iterator<PictureMemory> get iterator => _pictureMemoryList.iterator;

  PictureMemory operator [](int index) {
    if (index >= 0 && index < _pictureMemoryList.length) {
      return _pictureMemoryList[index];
    } else {
      throw ArgumentError('Invalid index: $index');
    }
  }
}
