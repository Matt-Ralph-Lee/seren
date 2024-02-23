import 'chat.dart';

class ChatList extends Iterable {
  final List<Chat> _chatList;

  List<Chat> get chatList => _chatList;

  ChatList(this._chatList);

  @override
  Iterator get iterator => _chatList.iterator;
}
