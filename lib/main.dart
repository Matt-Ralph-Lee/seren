import 'package:camera/camera.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seren/backend/function/notification_handler.dart';
import 'package:seren/presentation/shared/constants/settings/camera.dart';
import 'firebase_options.dart';

import 'backend/repository/local_repository/user_local_repository.dart';

import 'presentation/routers/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await UserLocalRepository.initialize();
  FirebaseMessaging.onBackgroundMessage(notificationHandler);
  cameras = await availableCameras();

  const app = App();
  const scope = ProviderScope(child: app);
  runApp(scope);
}
