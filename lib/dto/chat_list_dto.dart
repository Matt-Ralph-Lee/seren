import 'chat_dto.dart';

class ChatListDto extends Iterable<ChatDto> {
  final List<ChatDto> _chatList;

  List<ChatDto> get chatList => _chatList;

  ChatListDto(this._chatList);

  @override
  Iterator<ChatDto> get iterator => _chatList.iterator;
}
