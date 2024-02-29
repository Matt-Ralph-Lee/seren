import 'message.dart';

class MessageList extends Iterable<Message> {
  final List<Message> _messageList;

  List<Message> get messageList => _messageList;

  MessageList(this._messageList);

  @override
  Iterator<Message> get iterator => _messageList.iterator;
}
