import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../model/local_model/user_local_model.dart';

class UserLocalRepository {
  static final UserLocalRepository _cache = UserLocalRepository._internal();

  UserLocalRepository._internal();

  factory UserLocalRepository() {
    return _cache;
  }

  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    try {
      isar = await Isar.open(
        [UserLocalModelSchema],
        directory: dir.path,
      );
    } catch (e) {
      debugPrint("already initialized ${e.toString()}");
    }
  }

  Future<void> setDefault() async {
    final newUser = UserLocalModel();
    newUser.hasSend = false;
    final now = DateTime.now();
    DateTime fiveMinutesAgo = now.subtract(const Duration(minutes: 5));
    newUser.notifiedTime = fiveMinutesAgo.toIso8601String();
    newUser.swipeCount = 20;
    await isar.writeTxn(() => isar.userLocalModels.put(newUser));
  }

  Future<void> setDailyPictureStatus(bool newStatus) async {
    final user = await isar.userLocalModels.get(0);
    if (user != null) {
      user.hasSend = newStatus;
      await isar.writeTxn(() => isar.userLocalModels.put(user));
    }
  }

  Future<void> setNotifiedTime(String time) async {
    final user = await isar.userLocalModels.get(0);
    if (user != null) {
      user.notifiedTime = time;
      await isar.writeTxn(() => isar.userLocalModels.put(user));
    }
  }
}
