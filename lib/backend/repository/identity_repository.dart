import '../model/identity.dart';
import '../model/property/user_id.dart';
import '../model/property/user_icon_path.dart';
import '../model/property/username.dart';
import 'database.dart';
import 'storage_repository.dart';

class IdentityRepository {
  final db = Database.realtimeDatabaes;

  Future<void> setDefault(final UserId userId) async {
    final username = Username("Username");
    final userIconPath =
        UserIconPath(await StorageRepository().getDefaultUserIconPathURL());
    final identity = Identity(
      userId: userId,
      username: username,
      userIconPath: userIconPath,
    );

    await db.child("user/${userId.value}/identity").set({
      "username": identity.username.value,
      "userIconPath": identity.userIconPath.value,
    });
  }

  Future<void> set(final UserId userId, Identity identity) async {
    await db.child("user/${userId.value}/identity").set({
      "username": identity.username.value,
      "userIconPath": identity.userIconPath.value
    });
  }

  Future<Username> getUsername(final UserId userId) async {
    final event =
        await db.child("user/${userId.value}/identity/username").once();
    final usernameData = event.snapshot.value as String?;
    if (usernameData == null) throw Exception("cannot find username");
    return Username(usernameData);
  }

  Future<UserIconPath> getUserIconPath(final UserId userId) async {
    final event =
        await db.child("user/${userId.value}/identity/userIconPath").once();
    final userIconPathData = event.snapshot.value as String?;
    if (userIconPathData == null) throw Exception("cannot find userIconPath");
    return UserIconPath(userIconPathData);
  }
}
