import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:seren/presentation/shared/constants/page_path.dart';

class PermissionRequestPage extends HookWidget {
  const PermissionRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final visibilityState = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "permission request",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await Permission.notification.request();
            },
            child: const Text(
              "enable notification",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await Permission.location.request();
            },
            child: const Text(
              "enable location",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await Permission.camera.request();
            },
            child: const Text(
              "enable camera",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Permission.notification.isGranted.then((notificationState) {
                if (notificationState) {
                  Permission.location.isGranted.then((locationState) {
                    if (locationState) {
                      Permission.camera.isGranted.then((cameraState) {
                        if (cameraState) {
                          context.go(PagePath.initial);
                        }
                      });
                    }
                  });
                }
              });
              visibilityState.value = true;
            },
            child: const Text(
              "Next",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Visibility(
            visible: visibilityState.value,
            child: const Text(
              "please enable all",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
