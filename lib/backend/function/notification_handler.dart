import 'package:firebase_messaging/firebase_messaging.dart';

import '../repository/local_repository/user_local_repository.dart';

@pragma('vm:entry-point')
Future<void> notificationHandler(RemoteMessage message) async {
  await UserLocalRepository.initialize();
  final userLocalRepository = UserLocalRepository();
  await userLocalRepository.setDailyPictureStatus(false);
  await userLocalRepository.setNotifiedTime(message.data["timestamp"]);
}
