import 'chat.dart';

class ChatList extends Iterable<Chat> {
  final List<Chat> _chatList;

  List<Chat> get chatList => _chatList;

  ChatList(this._chatList);

  @override
  Iterator<Chat> get iterator => _chatList.iterator;
}
