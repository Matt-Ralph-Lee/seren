import '../model/profile.dart';
import '../model/property/gender.dart';
import '../model/property/long_intro.dart';
import '../model/property/short_intro.dart';
import '../model/property/user_id.dart';
import 'database.dart';

class ProfileRepository {
  final db = Database.realtimeDatabase;

  Future<void> setDefault(final UserId userId) async {
    final gender = Gender("other");
    final shortIntro = ShortIntro("");
    final longIntro = LongIntro("");
    final profile = Profile(
      gender: gender,
      shortIntro: shortIntro,
      longIntro: longIntro,
    );

    await db.child("user/${userId.value}/profile").set({
      "gender": profile.gender.value,
      "shortIntro": profile.shortIntro.value,
      "longIntro": profile.longIntro.value,
    });
  }

  Future<Profile> get(final UserId userId) async {
    final event = await db.child("user/${userId.value}/profile").once();
    final profileData = event.snapshot.value as Map<dynamic, dynamic>?;
    if (profileData == null) throw Exception("cannot find shortIntro");
    return Profile.fromRTDB(profileData);
  }

  Future<ShortIntro> getShortIntro(final UserId userId) async {
    final event =
        await db.child("user/${userId.value}/profile/shortIntro").once();
    final shortIntroData = event.snapshot.value as String?;
    if (shortIntroData == null) throw Exception("cannot find shortIntro");
    return ShortIntro(shortIntroData);
  }
}
