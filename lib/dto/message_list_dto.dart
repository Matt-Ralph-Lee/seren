import 'package:seren/dto/message_dto.dart';

class MessageListDto extends Iterable<MessageDto> {
  final List<MessageDto> _messageList;

  List<MessageDto> get messageList => _messageList;

  MessageListDto(this._messageList);

  @override
  Iterator<MessageDto> get iterator => _messageList.iterator;

  MessageDto operator [](int index) {
    if (index >= 0 && index < _messageList.length) {
      return _messageList[index];
    } else {
      throw ArgumentError('Invalid index: $index');
    }
  }
}
