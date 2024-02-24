import 'package:isar/isar.dart';

part "user_local_model.g.dart";

@collection
class UserLocalModel {
  Id id = 0;
  bool hasSend = false;
  String notifiedTime = "";
  int swipeCount = 20;
}
