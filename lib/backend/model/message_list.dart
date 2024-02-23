import 'message.dart';

class MessageList extends Iterable {
  final List<Message> _messageList;

  List<Message> get messageList => _messageList;

  MessageList(this._messageList);

  @override
  Iterator get iterator => _messageList.iterator;
}
