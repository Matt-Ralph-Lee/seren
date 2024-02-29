import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:seren/presentation/shared/constants/assets/asset_path.dart';
import 'package:seren/presentation/shared/constants/page_path.dart';

import '../controllers/write/set_identity/set_identity_controller.dart';

class InitialUserSettingPage extends HookConsumerWidget {
  const InitialUserSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setIdentityState = ref.watch(setIdentityControllerProvider);
    final selectedImagePath = useState("");

    Future<void> getImageFromGallery() async {
      // await PhotoPermissionsHandler().request();
      await Permission.photos.request();
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      selectedImagePath.value = image.path;
    }

    Future<void> cropImage() async {
      await getImageFromGallery();
      if (selectedImagePath.value.isEmpty) return;
      final cropper = ImageCropper();
      final croppedFile = await cropper.cropImage(
        sourcePath: selectedImagePath.value,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
      );
      if (croppedFile == null) return;
      selectedImagePath.value = croppedFile.path;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "initial user setting",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await cropImage();
            },
            child: const Text(
              "crop image",
              style: TextStyle(color: Colors.white),
            ),
          ),
          selectedImagePath.value.isEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset(AssetPath.defaultUserIcon))
              : ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.file(
                    File(selectedImagePath.value),
                  ),
                ),
          ElevatedButton(
            onPressed: setIdentityState.isLoading
                ? null
                : () {
                    ref
                        .read(setIdentityControllerProvider.notifier)
                        .execute(
                          usernameData: "usernameHoge",
                          userIconPathData: selectedImagePath.value,
                        )
                        .then((value) =>
                            context.push(PagePath.permissionRequest));
                  },
            child: const Text(
              "Set",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
