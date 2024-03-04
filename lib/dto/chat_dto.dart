import 'package:seren/dto/message_dto.dart';

class ChatDto {
  final String _chatId;
  final String _partnerIconPath;
  final String _partnerName;
  final MessageDto _message;

  String get chatId => _chatId;
  String get partnerIconPath => _partnerIconPath;
  String get partnername => _partnerName;
  MessageDto get message => _message;

  ChatDto({
    required final String chatId,
    required final String partnerIconPath,
    required final String partnerName,
    required final MessageDto message,
  })  : _chatId = chatId,
        _partnerIconPath = partnerIconPath,
        _partnerName = partnerName,
        _message = message;
}
