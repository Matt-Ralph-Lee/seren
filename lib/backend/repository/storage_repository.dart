import 'dart:io';

import '../model/property/user_id.dart';
import 'database.dart';

class StorageRepository {
  final db = Database.storage;

  Future<String> getDefaultUserIconPathURL() async {
    final defaultUserIconRef =
        db.child("assets/userIcon/default_user_icon.jpg");
    final defaulatUserIconURL = await defaultUserIconRef.getDownloadURL();

    return defaulatUserIconURL;
  }

  Future<String> getDefaultPrimaryPathURL() async {
    final defaultPrimaryPathRef =
        db.child("assets/memory/primary/default_primary_picture.jpg");
    final defaulatPrimaryPathURL = await defaultPrimaryPathRef.getDownloadURL();

    return defaulatPrimaryPathURL;
  }

  Future<String> getDefaultSecondaryPathURL() async {
    final defaultSecondaryPathRef =
        db.child("assets/memory/secondary/default_secondary_picture.jpg");
    final defaulatSecondaryPathURL =
        await defaultSecondaryPathRef.getDownloadURL();

    return defaulatSecondaryPathURL;
  }

  Future<String> setUserIcon({
    required final UserId userId,
    required final String filePath,
  }) async {
    final userIconPathRef = db.child(
        "user/${userId.value}/userIcon/${DateTime.now().toIso8601String()}.jpg");
    final task = await userIconPathRef.putFile(File(filePath));
    final imageURL = await task.ref.getDownloadURL();

    return imageURL;
  }
}
