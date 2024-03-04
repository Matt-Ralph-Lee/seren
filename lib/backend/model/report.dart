import 'property/report_text.dart';
import 'property/user_id.dart';

class Report {
  final UserId _userId;
  final UserId _targetUserId;
  final ReportText _text;

  UserId get userId => _userId;
  UserId get targetUserId => _targetUserId;
  ReportText get text => _text;

  Report({
    required final UserId userId,
    required final UserId targetUserId,
    required final ReportText text,
  })  : _userId = userId,
        _targetUserId = targetUserId,
        _text = text;
}
